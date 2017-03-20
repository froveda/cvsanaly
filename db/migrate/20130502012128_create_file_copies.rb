class CreateFileCopies < ActiveRecord::Migration
  def change
    create_table :file_copies do |t|
      t.integer :to_id
      t.integer :from_id
      t.integer :from_commit_id
      t.text :new_file_name
      t.integer :action_id

      t.timestamps
    end
  end
end
