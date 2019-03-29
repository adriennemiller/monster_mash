class CreateBeautyContests < ActiveRecord::Migration[5.2]
  def change
    create_table :beauty_contests do |t|

      t.timestamps
    end
  end
end
