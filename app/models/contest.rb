class Contest < ApplicationRecord
  has_many :entries

  def entry_monster_id
  end

  def vote_monster_id
  end

  def get_winner
    return nil if !self.has_ended
    monsters_hash = {}

    self.entries.each do |entry|
      monsters_hash[Monster.find_by(id: entry.monster_id)] = entry.votes.count
    end

    max_votes = monsters_hash.values.max
    monsters_hash.key(max_votes)
  end

  def end_contest

  end

end
