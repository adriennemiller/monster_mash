class Monster < ApplicationRecord
  belongs_to :user
  belongs_to :body_part, class_name: 'Head', foreign_key: :head_id
  belongs_to :body_part, class_name: 'Torso', foreign_key: :torso_id
  belongs_to :body_part, class_name: 'Leg', foreign_key: :leg_id
end
