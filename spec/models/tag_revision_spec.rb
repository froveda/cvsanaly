require 'rails_helper'

describe TagRevision do
  it "has a valid factory" do
    expect(build(:tag_revision)).to be_valid
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:tag) }
    it { is_expected.to validate_presence_of(:commit) }
  end

  describe "without a tag" do
    let(:object) { build(:tag_revision, tag: nil) }
    it_behaves_like "validating presence", :tag
  end

  describe "without a commit" do
    let(:object) { build(:tag_revision, commit: nil) }
    it_behaves_like "validating presence", :commit
  end
end