class AddFilenameToBodyParts < ActiveRecord::Migration[5.2]
  def change
    add_column :body_parts, :filename, :string
  end
end
