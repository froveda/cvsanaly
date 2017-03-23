FactoryGirl.define do
  factory :file_copy do
    action
    commit
    association :from, factory: :file_scm
    association :to, factory: :file_scm
    new_file_name 'example.txt'
  end
end