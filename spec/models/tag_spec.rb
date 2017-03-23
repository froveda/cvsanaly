require 'rails_helper'

describe Tag do
  it "has a valid factory" do
    expect(build(:tag)).to be_valid
  end

  describe "without a file_name" do
    let(:object) { build(:tag, name: nil) }
    it_behaves_like "validating presence", :name
  end
end