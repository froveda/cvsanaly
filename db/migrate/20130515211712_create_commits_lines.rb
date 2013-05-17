class CreateCommitsLines < ActiveRecord::Migration
  def change
    create_table :commits_lines do |t|
      t.integer :commit_id
      t.integer :added
      t.integer :removed

      t.timestamps
    end
  end
end
