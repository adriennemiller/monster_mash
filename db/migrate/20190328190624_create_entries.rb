class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.integer :beauty_contest_id
      t.integer :monster_id

      t.timestamps
    end
  end
end
