class CreateMetricsEvo < ActiveRecord::Migration
  def change
    create_table :metrics_evo do |t|
      t.integer :branch_id
      t.datetime :date
      t.integer :loc
      t.integer :sloc
      t.integer :files

      t.timestamps
    end
  end
end
