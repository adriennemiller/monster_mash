class User < ApplicationRecord
  has_many :monsters
  has_many :likes
  validates :name, {presence: true, uniqueness: true} 
  has_secure_password

end
