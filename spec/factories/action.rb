FactoryGirl.define do
  factory :action do
    branch
    commit
    file_scm
    type 'A'
  end
end