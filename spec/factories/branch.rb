FactoryGirl.define do
  factory :branch do
    name { Faker::Name.name }
  end
end