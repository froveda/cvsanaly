## Presence
RSpec.shared_examples "validating presence" do |attribute|
  let(:attribute) { attribute }

  it "must be invalid" do
    expect(object).to_not be_valid
    expect(object.errors[attribute]).to include("can't be blank")
  end
end