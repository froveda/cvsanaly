class CreateActionsFileNames < ActiveRecord::Migration
  def change
    create_table :actions_file_names do |t|
      t.string :type
      t.integer :file_id
      t.text :new_file_name
      t.integer :commit_id

      t.timestamps
    end
  end
end
