require 'rails_helper'

describe CommitsLine do
  it "has a valid factory" do
    expect(build(:commits_line)).to be_valid
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:commit) }
    it { is_expected.to validate_presence_of(:added) }
    it { is_expected.to validate_presence_of(:removed) }
    it { is_expected.to validate_numericality_of(:added).only_integer.is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_numericality_of(:removed).only_integer.is_greater_than_or_equal_to(0) }
  end

  describe "without a commit" do
    let(:object) { build(:commits_line, commit: nil) }
    it_behaves_like "validating presence", :commit
  end

  describe "without added" do
    let(:object) { build(:commits_line, added: nil) }
    it_behaves_like "validating presence", :added
  end

  describe "without removed" do
    let(:object) { build(:commits_line, removed: nil) }
    it_behaves_like "validating presence", :removed
  end

  describe "when added is not a number" do
    let(:object) { build(:commits_line, added: 'a') }
    it_behaves_like "validating that is a number", :added
  end

  describe "when removed is not a number" do
    let(:object) { build(:commits_line, removed: 'a') }
    it_behaves_like "validating that is a number", :removed
  end

  describe "when added is a number less than 0" do
    let(:object) { build(:commits_line, added: -1) }
    it_behaves_like "validating number greater than or equal to a count", :added, 0
  end

  describe "when removed is a number less than 0" do
    let(:object) { build(:commits_line, removed: -1) }
    it_behaves_like "validating number greater than or equal to a count", :removed, 0
  end
end