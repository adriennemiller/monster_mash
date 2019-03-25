class Monster < ApplicationRecord
  belongs_to :user
  belongs_to :head, optional: true
  belongs_to :torso, optional: true
  belongs_to :leg, optional: true
end
