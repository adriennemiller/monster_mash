class Monster < ApplicationRecord
  belongs_to :user
  belongs_to :head
  belongs_to :torso
  belongs_to :leg
end
