require 'rails_helper'

describe Branch do
  it "has a valid factory" do
    expect(build(:branch)).to be_valid
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe "without a name" do
    let(:object) { build(:branch, name: nil) }
    it_behaves_like "validating presence", :name
  end
end