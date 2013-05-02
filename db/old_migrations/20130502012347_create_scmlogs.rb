class CreateScmlogs < ActiveRecord::Migration
  def change
    create_table :scmlogs do |t|
      t.text :rev
      t.integer :committer_id
      t.integer :author_id
      t.datetime :date
      t.text :message
      t.boolean :composed_rev
      t.integer :repository_id

      t.timestamps
    end
  end
end
