class CreateActionFiles < ActiveRecord::Migration
  def change
    create_table :action_files do |t|
      t.integer :file_id
      t.integer :action_id
      t.string :action_type
      t.integer :commit_id

      t.timestamps
    end
  end
end
