require 'rails_helper'

describe Branch do
  it "has a valid factory" do
    expect(build(:file_link)).to be_valid
  end

  describe "without a commit" do
    let(:object) { build(:file_link, commit: nil) }
    it_behaves_like "validating presence", :commit
  end

  describe "without a file_scm" do
    let(:object) { build(:file_link, file_scm: nil) }
    it_behaves_like "validating presence", :file_scm
  end

  describe "without a file_path" do
    let(:object) { build(:file_link, file_path: nil) }
    it_behaves_like "validating presence", :file_path
  end

  it "is valid with or without a parent" do
    file_link = build(:file_link)
    file_link.parent = nil
    expect(file_link).to be_valid

    file_link.parent = build(:file_scm)
    expect(file_link).to be_valid
  end
end