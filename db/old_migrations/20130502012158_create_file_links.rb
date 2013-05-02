class CreateFileLinks < ActiveRecord::Migration
  def change
    create_table :file_links do |t|
      t.integer :parent_id
      t.integer :file_id
      t.integer :commit_id
      t.string :file_path

      t.timestamps
    end
  end
end
