class User < ApplicationRecord
  has_many :monsters
  validates :name, presence: true
  validates :name, uniqueness: true
  # has_secure_password
end
