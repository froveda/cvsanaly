require 'rails_helper'

describe BadSmellByNfunctionsController do

  describe 'with guest user' do
    context 'Get #bad_smell_by_nfunctions' do
      it_behaves_like 'redirect to login path when no user is logged in', :bad_smell_by_nfunctions
    end

    context 'Get #bad_smell_by_nfunctions_filtered' do
      it_behaves_like 'redirect to login path when no user is logged in', :bad_smell_by_nfunctions_filtered
    end
  end

  describe 'with user logged in' do
    login_user
    it_behaves_like 'access to :bad_smell_by_nfunctions with user logged in'
    it_behaves_like 'access to :bad_smell_by_nfunctions_filtered with user logged in'
  end

  describe 'with admin logged in' do
    login_admin
    it_behaves_like 'access to :bad_smell_by_nfunctions with user logged in'
    it_behaves_like 'access to :bad_smell_by_nfunctions_filtered with user logged in'
  end
end