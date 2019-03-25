class CreateTorsos < ActiveRecord::Migration[5.2]
  def change
    create_table :torsos do |t|

      t.timestamps
    end
  end
end
