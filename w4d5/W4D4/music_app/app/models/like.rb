class Like < ApplicationRecord
  validates :user_id, :album_id, presence: true
  validates :user_id,
    uniqueness: {scope: :album_id, message: "Already liked that album"}

  belongs_to :user
  belongs_to :album
end
