class Metric < ActiveRecord::Base
  attr_accessible :commit_id, :file_id, :halstead_length, :halstead_level, :halstead_md, :halstead_vol, :lang, :lblank, :lcomment, :loc, :mccabe_max, :mccabe_mean, :mccabe_median, :mccabe_min, :mccabe_sum, :ncomment, :nfunctions, :sloc

  belongs_to :commit
  belongs_to :file, class_name: "FileScm", foreign_key: :file_id
end
