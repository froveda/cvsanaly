require 'rails_helper'
require "cancan/matchers"

describe Ability do

  describe "abilities" do
    subject(:ability){ Ability.new(user) }
    let(:user) { nil }

    context "when it is a guest" do
      it{ is_expected.not_to be_able_to(:read, :all) }
      it{ is_expected.not_to be_able_to(:access, :rails_admin) }
    end

    context "when it is a user" do
      let(:user) { create(:user) }

      it{ is_expected.to be_able_to(:read, :all) }
      it{ is_expected.not_to be_able_to(:access, :rails_admin) }
    end

    context "when it is an admin" do
      let(:user) { create(:admin) }

      it{ is_expected.to be_able_to(:manage, :all) }
      it{ is_expected.to be_able_to(:access, :rails_admin) }
    end
  end
end