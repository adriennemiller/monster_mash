class User < ApplicationRecord
  has_many :monsters
  validates :name, {presence: true, uniqueness: true} 
  has_secure_password

end
