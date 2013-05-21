class CreateMonths < ActiveRecord::Migration
  def change
    create_table :months do |t|
      t.datetime :date

      t.timestamps
    end
  end
end
