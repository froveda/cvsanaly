require 'rails_helper'

describe MetricsEvo do
  it "has a valid factory" do
    expect(build(:metrics_evo)).to be_valid
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:branch) }
    it { is_expected.to validate_presence_of(:files) }
    it { is_expected.to validate_presence_of(:loc) }
    it { is_expected.to validate_presence_of(:sloc) }
    it { is_expected.to validate_numericality_of(:files).only_integer.is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_numericality_of(:loc).only_integer.is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_numericality_of(:sloc).only_integer.is_greater_than_or_equal_to(0) }
  end

  describe "without a branch" do
    let(:object) { build(:metrics_evo, branch: nil) }
    it_behaves_like "validating presence", :branch
  end

  describe "without files" do
    let(:object) { build(:metrics_evo, files: nil) }
    it_behaves_like "validating presence", :files
  end

  describe "without loc" do
    let(:object) { build(:metrics_evo, loc: nil) }
    it_behaves_like "validating presence", :loc
  end

  describe "without sloc" do
    let(:object) { build(:metrics_evo, sloc: nil) }
    it_behaves_like "validating presence", :sloc
  end

  describe "when files is not a number" do
    let(:object) { build(:metrics_evo, files: 'a') }
    it_behaves_like "validating that is a number", :files
  end

  describe "when files is a number less than 0" do
    let(:object) { build(:metrics_evo, files: -1) }
    it_behaves_like "validating number greater than or equal to a count", :files, 0
  end

  describe "when loc is not a number" do
    let(:object) { build(:metrics_evo, loc: 'a') }
    it_behaves_like "validating that is a number", :loc
  end

  describe "when loc is a number less than 0" do
    let(:object) { build(:metrics_evo, loc: -1) }
    it_behaves_like "validating number greater than or equal to a count", :loc, 0
  end

  describe "when sloc is not a number" do
    let(:object) { build(:metrics_evo, sloc: 'a') }
    it_behaves_like "validating that is a number", :sloc
  end

  describe "when sloc is a number less than 0" do
    let(:object) { build(:metrics_evo, sloc: -1) }
    it_behaves_like "validating number greater than or equal to a count", :sloc, 0
  end
end