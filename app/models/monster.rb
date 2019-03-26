class Monster < ApplicationRecord
  belongs_to :user
  belongs_to :head, class_name: 'BodyPart', foreign_key: :head_id, optional: true
  belongs_to :torso, class_name: 'BodyPart', foreign_key: :torso_id, optional: true
  belongs_to :leg, class_name: 'BodyPart', foreign_key: :leg_id, optional: true
end
