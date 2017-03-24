FactoryGirl.define do
  factory :metrics_evo do
    branch
    date Date.today
    files { Faker::Number.number(10) }
    loc { Faker::Number.number(10) }
    sloc { Faker::Number.number(10) }
  end
end