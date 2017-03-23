FactoryGirl.define do
  factory :commit do
    association :committer, factory: :person
    association :author, factory: :person
    repository
    message { Faker::Lorem.sentence }
    date DateTime.now
  end
end