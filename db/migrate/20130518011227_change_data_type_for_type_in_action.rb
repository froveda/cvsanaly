class ChangeDataTypeForTypeInAction < ActiveRecord::Migration
  def self.up
    change_table :actions do |t|
      t.change :type, :string
    end
  end

  def self.down
    hange_table :actions do |t|
      t.change :type, "varchar(1)"
    end
  end
end
