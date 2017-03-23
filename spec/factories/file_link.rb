FactoryGirl.define do
  factory :file_link do
    commit
    file_scm
    file_path { 'dir/subdir' }
  end
end