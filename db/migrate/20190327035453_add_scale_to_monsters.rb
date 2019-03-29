class AddScaleToMonsters < ActiveRecord::Migration[5.2]
  def change
    add_column :monsters, :face_scale, :float
    add_column :monsters, :head_scale, :float
    add_column :monsters, :torso_scale, :float
    add_column :monsters, :leg_scale, :float
  end
end
