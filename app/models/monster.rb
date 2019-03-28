class Monster < ApplicationRecord
  include ActionView::Helpers::TextHelper

  belongs_to :user
  belongs_to :head, class_name: 'BodyPart', foreign_key: :head_id, optional: true
  belongs_to :torso, class_name: 'BodyPart', foreign_key: :torso_id, optional: true
  belongs_to :leg, class_name: 'BodyPart', foreign_key: :leg_id, optional: true

  def get_mood
    case self.happiness
    when 0..3
      "sad"
    when 4..6
      "neutral"
    when 7..10 
      "happy"
    else
      "neutral"
    end
  end

  def get_time_elapsed_since_last_fed
    humanize(((Time.zone.now - self.time_last_fed)).to_i)
  end

  private 

  # https://stackoverflow.com/questions/4136248/how-to-generate-a-human-readable-time-range-using-ruby-on-rails
  def humanize secs
    [[60, "second"], [60, "minute"], [24, "hour"], [Float::INFINITY, "day"]].map{ |count, name|
      if secs > 0
        secs, n = secs.divmod(count)
        "#{pluralize(n.to_i, name)} " unless n.to_i==0
      end
    }.compact.reverse.join(' ')
  end
end
