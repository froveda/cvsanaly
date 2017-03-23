FactoryGirl.define do
  factory :repository do
    name { Faker::Name.name }
    uri { Faker::Internet.url }
    type 'svn'
  end
end