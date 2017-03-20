class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :uri
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
