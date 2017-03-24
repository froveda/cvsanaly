FactoryGirl.define do
  factory :metric do
    commit
    association :file, factory: :file_scm
    lang { Faker::Lorem.word }
  end
end