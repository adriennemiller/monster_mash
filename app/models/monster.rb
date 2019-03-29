class Monster < ApplicationRecord
  belongs_to :user
  belongs_to :face, class_name: 'BodyPart', foreign_key: :face_id, optional: true
  belongs_to :head, class_name: 'BodyPart', foreign_key: :head_id, optional: true
  belongs_to :torso, class_name: 'BodyPart', foreign_key: :torso_id, optional: true
  belongs_to :leg, class_name: 'BodyPart', foreign_key: :leg_id, optional: true
  has_many :likes
  has_one :entry
  
  validates :name, presence: true, uniqueness: true

  def mood
    case self.happiness
    when 0..2
      "angry"
    when 3..5
      "sad"
    when 6..10
      "happy"
    else
      "happy"
    end
  end

  def age
    ((Time.zone.now - self.created_at) / (60*60*24)).to_i + 1
  end

  def height
    top = 0
    ys = {}

    # Get min/max y to calculate the height
    if self.head_id
      ys[:head] = self.head_y
    end

    if self.torso_id
      ys[:torso] = self.torso_y
    end

    if self.leg_id
      ys[:leg] = self.leg_y
    end

    min_y = ys.values.min
    max_y = ys.values.max
    max_section = ys.key(max_y)

    case max_section
    when "head"
      max_y += 200 * head_scale_y
    when "torso"
      max_y += 200 * torso_scale_y
    when "leg"
      max_y += 200 * leg_scale_y
    end

    max_y - min_y
  end

  def weight
    weight = 0

    if self.head_id
      weight += 10 * self.head_scale_x
    end

    if self.torso_id
      weight += 20 * self.torso_scale_x
    end

    if self.leg_id
      weight += 15 * self.leg_scale_x
    end

    weight - self.name.length/5.0
  end

  def get_hours_since_last_fed
    (Time.zone.now - self.time_last_fed) / (60 * 60)
  end

  def update_happiness
    case get_hours_since_last_fed
    when 0..24
      self.happiness = (16 - get_hours_since_last_fed/3).clamp(0, 10)
    when 25..36
      self.happiness = (15 - get_hours_since_last_fed/3 ).clamp(0, 10)
    when get_hours_since_last_fed > 37
      self.happiness = (14 - get_hours_since_last_fed/3).clamp(0, 10)
    end
  end

  private

  def clamp(min, max)
    [[self, max].min, min].max
  end
end
