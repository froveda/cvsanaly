class CreateFileTypes < ActiveRecord::Migration
  def change
    create_table :file_types do |t|
      t.integer :file_id
      t.text :type

      t.timestamps
    end
  end
end
