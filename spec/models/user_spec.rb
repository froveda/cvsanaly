require 'rails_helper'

describe User do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  describe "without an email" do
    let(:object) { build(:user, email: nil) }
    it_behaves_like "validating presence", :email
  end

  describe "without an password" do
    let(:object) { build(:user, password: nil) }
    it_behaves_like "validating presence", :password
  end

  describe "with an invalid email format" do
    let(:object) { build(:user, email: 'invalid email') }
    it_behaves_like "validating format", :email
  end
end