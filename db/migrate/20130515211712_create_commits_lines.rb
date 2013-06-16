class CreateCommitsLines < ActiveRecord::Migration
  def change
    begin
    create_table :commits_lines do |t|
      t.integer :commit_id
      t.integer :added
      t.integer :removed

      t.timestamps
    end
    rescue
    end
  end
end
