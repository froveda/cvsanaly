class CreateTagRevisions < ActiveRecord::Migration
  def change
    create_table :tag_revisions do |t|
      t.integer :tag_id
      t.integer :commit_id

      t.timestamps
    end
  end
end
