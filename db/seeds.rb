user = User.find_by_email("admin@example.com")
unless user.nil?
  user.destroy
end

user = User.find_by_email("froveda@gmail.com")
if user.nil?
  User.create!(:email=>'froveda@gmail.com',:password=>'aldMdRTjikL')
end