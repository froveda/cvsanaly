FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password 'passw0rd'
    admin false

    factory :admin do
      admin true
    end
  end
end