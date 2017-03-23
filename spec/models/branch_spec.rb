require 'rails_helper'

describe Branch do
  it "has a valid factory" do
    expect(build(:branch)).to be_valid
  end

  describe "without a file_name" do
    let(:object) { build(:branch, name: nil) }
    it_behaves_like "validating presence", :name
  end
end