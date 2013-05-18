namespace :actions do

  desc "Change the value of type"
  task :change_type_value => :environment do |t, args|
    Action.all.each do |action|
      action.type = value_of_type(action.type)
      action.save!
    end
  end

  def value_of_type(value)
      return "Add" if(value.eql?("A"))
      return "Modified" if(value.eql?("M"))
      return "Deleted" if(value.eql?("D"))
      return "Moved (Renamed)" if(value.eql?("V"))
      return "Copied" if(value.eql?("C"))
      return "Replaced" if(value.eql?("R"))
      return value
  end
end