class AddHasWonContestToMonsters < ActiveRecord::Migration[5.2]
  def change
    add_column :monsters, :has_won_contest, :boolean
  end
end
