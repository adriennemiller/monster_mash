class Entry < ApplicationRecord
  belongs_to :beauty_contest
  has_many :votes
end
