# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.find_by_email("admin@example.com")
unless user.nil?
  user.destroy
end

user = User.find_by_email("froveda@gmail.com")
if user.nil?
  User.create!(:email=>'froveda@gmail.com',:password=>'aldMdRTjikL')
end