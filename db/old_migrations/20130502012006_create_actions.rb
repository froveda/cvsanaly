class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string :type
      t.integer :file_id
      t.integer :commit_id
      t.integer :branch_id

      t.timestamps
    end
  end
end
