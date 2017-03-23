FactoryGirl.define do
  factory :file_scm do
    file_name { Faker::Name.name }
    repository
  end
end