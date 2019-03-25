class CreateHeads < ActiveRecord::Migration[5.2]
  def change
    create_table :heads do |t|

      t.timestamps
    end
  end
end
