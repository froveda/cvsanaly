## Presence
RSpec.shared_examples "validating presence" do |attribute|
  let(:attribute) { attribute }

  it "must be invalid" do
    expect(object).to_not be_valid
    expect(object.errors[attribute]).to include(I18n.t('errors.messages.blank'))
  end
end

## Attribute must be included in a list
RSpec.shared_examples "validating that it is included in the list of values" do |attribute|
  let(:attribute) { attribute }

  it "must be invalid" do
    expect(object).to_not be_valid
    expect(object.errors[attribute]).to include(I18n.t('errors.messages.inclusion'))
  end
end