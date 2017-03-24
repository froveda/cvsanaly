require 'rails_helper'

describe Action do
  it "has a valid factory" do
    expect(build(:action)).to be_valid
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:branch) }
    it { is_expected.to validate_presence_of(:commit) }
    it { is_expected.to validate_presence_of(:file_scm) }
    it { is_expected.to validate_presence_of(:type) }
    it { is_expected.to validate_inclusion_of(:type).in_array(%w(A M D V C R)) }
  end

  describe "without a branch" do
    let(:object) { build(:action, branch: nil) }
    it_behaves_like "validating presence", :branch
  end

  describe "without a commit" do
    let(:object) { build(:action, commit: nil) }
    it_behaves_like "validating presence", :commit
  end

  describe "without a file_scm" do
    let(:object) { build(:action, file_scm: nil) }
    it_behaves_like "validating presence", :file_scm
  end

  describe "without a type" do
    let(:object) { build(:action, type: nil) }
    it_behaves_like "validating presence", :type
  end

  describe "with an invalid type" do
    let(:object) { build(:action, type: 'Z') }
    it_behaves_like "validating that it is included in the list of values", :type
  end

  it "returns a correct title" do
    action = build(:action)
    expected_title = "#{action.type} #{action.file_scm.title} to #{action.commit.title}"
    expect(action.title).to eq(expected_title)
  end
end