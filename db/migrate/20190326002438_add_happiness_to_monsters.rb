class AddHappinessToMonsters < ActiveRecord::Migration[5.2]
  def change
    add_column :monsters, :happiness, :integer
  end
end
