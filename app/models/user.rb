class User < ApplicationRecord
  has_secure_password
  has_many :playlists
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  u = validates :first_name, :last_name, :email, presence: true, on: :create
  if u
    validates :password, length: { in: 8..32 }, on: :create
    validates :first_name, :last_name, length: { in: 2..50 }, on: :create
    validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }, on: :create
  end
  has_secure_password
  has_many :playlists
end
