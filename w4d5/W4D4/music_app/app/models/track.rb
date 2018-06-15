# == Schema Information
#
# Table name: tracks
#
#  id         :bigint(8)        not null, primary key
#  album_id   :integer          not null
#  title      :string           not null
#  ord        :integer          not null
#  track_type :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord
  validates :album_id, :title, :ord, presence: true

  belongs_to :album,
    foreign_key: :album_id,
    class_name: :Album
end
