class Monster < ApplicationRecord
  belongs_to :user
  belongs_to :head, class_name: 'BodyPart', foreign_key: :head_id, optional: true
  belongs_to :torso, class_name: 'BodyPart', foreign_key: :torso_id, optional: true
  belongs_to :leg, class_name: 'BodyPart', foreign_key: :leg_id, optional: true
  has_many :likes

  validates :name, presence: true

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
    ((Time.zone.now - self.created_at) / (60*60*24)).to_i + 1
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

  def get_hours_since_last_fed
    (Time.zone.now - self.time_last_fed) / (60 * 60)
  end

  def update_happiness
    self.happiness = (24/3 - get_hours_since_last_fed).clamp(0, 10)
  end

  private

  def clamp(min, max)
    [[self, max].min, min].max
  end
end
