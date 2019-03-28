class Monster < ApplicationRecord
  include ActionView::Helpers::TextHelper

  belongs_to :user
  belongs_to :head, class_name: 'BodyPart', foreign_key: :head_id, optional: true
  belongs_to :torso, class_name: 'BodyPart', foreign_key: :torso_id, optional: true
  belongs_to :leg, class_name: 'BodyPart', foreign_key: :leg_id, optional: true
  has_many :likes

  def mood
    case self.happiness
    when 0..3
      "Sad"
    when 4..6
      "neutral"
    when 7..10 
      "Happy"
    else
      "Neutral"
    end
  end 

  def age
    ((Time.zone.now - self.created_at) / (3600)).to_i
  end

  def height 
    height = 0

    if self.head_id
      height += 35 * self.head_scale_y
    end

    if self.torso_id
      height += 75 * self.torso_scale_y
    end

    if self.leg_id
      height += 80 * self.leg_scale_y
    end

    height + self.name.length/10.0
  end

  def weight
    weight = 0
    
    if self.head_id
      weight += 10 * self.head_scale_x
      weight += 10 * self.head_scale_y
    end

    if self.torso_id
      weight += 20 * self.torso_scale_x
      weight += 20 * self.torso_scale_y
    end

    if self.leg_id
      weight += 15 * self.leg_scale_x
      weight += 15 * self.leg_scale_y
    end

    weight - self.name.length/5.0
  end

  def get_time_elapsed_since_last_fed
    (Time.zone.now - self.time_last_fed)
  end

  def get_happiness_by_hunger
    case self.get_time_elapsed_since_last_fed
    when 0
      0
    end
  end
end
