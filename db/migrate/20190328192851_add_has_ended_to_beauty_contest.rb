class AddHasEndedToBeautyContest < ActiveRecord::Migration[5.2]
  def change
    add_column :beauty_contests, :has_ended, :boolean
  end
end
