class Song < ApplicationRecord
  validates :title, :artist , presence:true , length: { in: 2..50 }
  has_many :playlists
end
