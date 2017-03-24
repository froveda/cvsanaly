require 'rails_helper'

describe User do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to validate_length_of(:password).is_at_least(8) }
  end

  describe "without an email" do
    let(:object) { build(:user, email: nil) }
    it_behaves_like "validating presence", :email
  end

  describe "without a password" do
    let(:object) { build(:user, password: nil) }
    it_behaves_like "validating presence", :password
  end

  describe "with an invalid email format" do
    let(:object) { build(:user, email: 'invalid email') }
    it_behaves_like "validating format", :email
  end

  describe "with a repeated email" do
    let!(:user) { create(:user, email: 'email@example.com') }
    let!(:object) { build(:user, email: 'email@example.com') }
    it_behaves_like "validating if it is taken", :email
  end

  describe "with a short password" do
    let(:object) { build(:user, password: 'pass') }
    it_behaves_like "validating attribute is too short", :password, 8
  end
end