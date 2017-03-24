require 'rails_helper'

describe FileCopy do
  it "has a valid factyory" do
    expect(build(:file_copy)).to be_valid
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:action) }
    it { is_expected.to validate_presence_of(:commit) }
    it { is_expected.to validate_presence_of(:from) }
    it { is_expected.to validate_presence_of(:to) }
    it { is_expected.to validate_presence_of(:new_file_name) }
  end

  describe "without a action" do
    let(:object) { build(:file_copy, action: nil) }
    it_behaves_like "validating presence", :action
  end

  describe "without a commit" do
    let(:object) { build(:file_copy, commit: nil) }
    it_behaves_like "validating presence", :commit
  end

  describe "without a from" do
    let(:object) { build(:file_copy, from: nil) }
    it_behaves_like "validating presence", :from
  end

  describe "without a to" do
    let(:object) { build(:file_copy, to: nil) }
    it_behaves_like "validating presence", :to
  end

  describe "without a new_file_name" do
    let(:object) { build(:file_copy, new_file_name: nil) }
    it_behaves_like "validating presence", :new_file_name
  end
end