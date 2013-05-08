class WelcomeController < ApplicationController
  protect_from_forgery

  def home
  end

  def files_history
    @files = FileScm.all.select{|file| !file.type.eql?("unknown")}.sort{|a,b| a.file_name <=> b.file_name}
  end
end
