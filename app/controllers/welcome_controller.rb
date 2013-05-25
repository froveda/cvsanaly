class WelcomeController < ApplicationController
  protect_from_forgery
  before_filter :authenticate_user!
  layout 'flatly'

  def home
  end

  def files_history
    @files = FileScm.joins(:type).where("type <> 'unknown'").order("file_name DESC")
  end

  def bad_smell_by_sloc
    @files = FileScm.joins(:metrics).where("lang='java' and sloc > 100").group("file_id")
  end

  def bad_smell_by_nfunctions
    @files = FileScm.joins(:metrics).where("lang='java' and nfunctions > 10").group("file_id")
  end
end
