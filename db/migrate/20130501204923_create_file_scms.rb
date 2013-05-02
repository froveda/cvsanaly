class CreateFileScms < ActiveRecord::Migration
  def change
    create_table :file_scms do |t|
      t.string :file_name
      t.integer :repository_id

      t.timestamps
    end
  end
end
