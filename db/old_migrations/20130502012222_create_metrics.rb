class CreateMetrics < ActiveRecord::Migration
  def change
    create_table :metrics do |t|
      t.integer :file_id
      t.integer :commit_id
      t.text :lang
      t.integer :sloc
      t.integer :loc
      t.integer :ncomment
      t.integer :lcomment
      t.integer :lblank
      t.integer :nfunctions
      t.integer :mccabe_max
      t.integer :mccabe_min
      t.integer :mccabe_sum
      t.integer :mccabe_mean
      t.integer :mccabe_median
      t.integer :halstead_length
      t.integer :halstead_vol
      t.float :halstead_level
      t.integer :halstead_md

      t.timestamps
    end
  end
end
