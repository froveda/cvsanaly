require 'rails_helper'

describe Person do
  it "has a valid factory" do
    expect(build(:person)).to be_valid
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:name) }
  end

  describe "without a name" do
    let(:object) { build(:person, name: nil) }
    it_behaves_like "validating presence", :name
  end

  describe "without an email" do
    let(:object) { build(:person, email: nil) }
    it_behaves_like "validating presence", :email
  end
end