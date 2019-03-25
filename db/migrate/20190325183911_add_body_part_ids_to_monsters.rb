class AddBodyPartIdsToMonsters < ActiveRecord::Migration[5.2]
  def change
    add_column :monsters, :head_id, :integer
    add_column :monsters, :torso_id, :integer
    add_column :monsters, :leg_id, :integer
  end
end
