require 'rails_helper'

describe Repository do
  it "has a valid factory" do
    expect(build(:repository)).to be_valid
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:type) }
    it { is_expected.to validate_presence_of(:uri) }
  end

  describe "without a name" do
    let(:object) { build(:repository, name: nil) }
    it_behaves_like "validating presence", :name
  end

  describe "without a uri" do
    let(:object) { build(:repository, uri: nil) }
    it_behaves_like "validating presence", :uri
  end

  describe "without a type" do
    let(:object) { build(:repository, type: nil) }
    it_behaves_like "validating presence", :type
  end
end