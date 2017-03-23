FactoryGirl.define do
  factory :file_type do
    association :file, factory: :file_scm
    type { Faker::Lorem.word }
  end
end