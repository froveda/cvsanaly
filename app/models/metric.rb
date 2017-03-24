class Metric < ActiveRecord::Base
  attr_accessible :commit_id, :file_id, :halstead_length, :halstead_level, :halstead_md, :halstead_vol, :lang, :lblank, :lcomment, :loc, :mccabe_max, :mccabe_mean, :mccabe_median, :mccabe_min, :mccabe_sum, :ncomment, :nfunctions, :sloc

  belongs_to :commit
  belongs_to :file, class_name: "FileScm", foreign_key: :file_id

  validates_presence_of :commit, :file, :lang
  validates_numericality_of :halstead_length, :halstead_level, :halstead_md, :halstead_vol, :lblank, :lcomment, :loc, :mccabe_max, :mccabe_mean, :mccabe_median, :mccabe_min, :mccabe_sum, :ncomment, :nfunctions, :sloc, only_integer: true, greater_than_or_equal_to: 0, allow_nil: true
  validates_numericality_of :halstead_level, greater_than_or_equal_to: 0, allow_nil: true
end
