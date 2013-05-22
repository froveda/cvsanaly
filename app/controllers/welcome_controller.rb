class WelcomeController < ApplicationController
  protect_from_forgery
  before_filter :authenticate_user!
  layout 'flatly'

  def home
  end

  def files_history
    @files = FileScm.all.select{|file| !file.type.eql?("unknown")}.sort{|a,b| a.file_name <=> b.file_name}
  end

  def bad_smell_by_sloc
    @files = Metric.where("lang='java' and sloc > 100").group("file_id").collect{|metric| metric.file}
  end

  def bad_smell_by_nfunctions
    @files = Metric.where("lang='java' and nfunctions > 10").group("file_id").collect{|metric| metric.file}
  end
end
