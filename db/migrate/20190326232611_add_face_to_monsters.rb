class AddFaceToMonsters < ActiveRecord::Migration[5.2]
  def change
    add_column :monsters, :face_id, :integer
    add_column :monsters, :face_x, :integer
    add_column :monsters, :face_y, :integer
  end
end
