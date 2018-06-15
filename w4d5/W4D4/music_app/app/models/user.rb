# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  attr_reader :password

  # VALIDATIONS

  after_initialize :ensure_session_token
  validates :email, uniqueness: true, presence: true
  validates :password, length: {minimum: 6}, allow_nil: true
  validates :password_digest, :name, presence: true

  # ASSOCIATIONS

  has_many :likes

  has_many :liked_albums,
    through: :likes,
    source: :album

  has_many :bands,
    through: :liked_albums,
    source: :band

  # CLASS METHODS

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    if user
      user.is_password?(password) ? user : nil
    else
      nil
    end
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(8)
  end

  # AUTH INSTANCE METHODS

  def reset_session_token!
    self.session_token = User.generate_session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    hash = BCrypt::Password.new(self.password_digest)
    hash.is_password?(password)
  end

  # DATABASE INSTANCE METHODS

  def top_bands
    liked_albums
      .joins(:band)
      .group('bands.name')
      .order('COUNT(albums.id)')
      .select('bands.name')
      .limit(3)
  end

end
