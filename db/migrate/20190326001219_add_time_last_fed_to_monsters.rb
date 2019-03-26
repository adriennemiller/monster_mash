class AddTimeLastFedToMonsters < ActiveRecord::Migration[5.2]
  def change
    add_column :monsters, :time_last_fed, :timestamp
  end
end
