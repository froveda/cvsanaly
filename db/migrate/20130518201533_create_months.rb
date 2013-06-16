class CreateMonths < ActiveRecord::Migration
  def change
    begin
    create_table :months do |t|
      t.datetime :date

      t.timestamps
    end
    rescue
    end
  end
end
