class AddScaleToMonsters < ActiveRecord::Migration[5.2]
  def change
    add_column :monsters, :face_scale_x, :float
    add_column :monsters, :face_scale_y, :float
    add_column :monsters, :head_scale_x, :float
    add_column :monsters, :head_scale_y, :float
    add_column :monsters, :torso_scale_x, :float
    add_column :monsters, :torso_scale_y, :float
    add_column :monsters, :leg_scale_x, :float
    add_column :monsters, :leg_scale_y, :float
  end
end
