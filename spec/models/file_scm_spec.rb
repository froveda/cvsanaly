require 'rails_helper'

describe FileScm do
  it "has a valid factory" do
    expect(build(:file_scm)).to be_valid
  end

  describe "without a file_name" do
    let(:object) { build(:file_scm, file_name: nil) }
    it_behaves_like "validating presence", :file_name
  end

  describe "without a repository" do
    let(:object) { build(:file_scm, repository: nil) }
    it_behaves_like "validating presence", :repository
  end

  it "returns the title as the file_scm file_name" do
    file = build(:file_scm)
    expect(file.title).to eq(file.file_name)
  end
end