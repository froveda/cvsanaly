require 'rails_helper'

describe BadSmellByNfunctionsController do

  describe 'Get #bad_smell_by_nfunctions' do
    it_behaves_like 'redirect to login path when no user is logged in', :bad_smell_by_nfunctions

    context 'with user logged in' do
      login_user
      it_behaves_like 'access to :bad_smell_by_nfunctions with user logged in'
    end

    context 'with admin logged in' do
      login_admin
      it_behaves_like 'access to :bad_smell_by_nfunctions with user logged in'
    end
  end

  describe 'Get #bad_smell_by_nfunctions_filtered' do
    it_behaves_like 'redirect to login path when no user is logged in', :bad_smell_by_nfunctions_filtered

    context 'with user logged in' do
      login_user
      it_behaves_like 'access to :bad_smell_by_nfunctions_filtered with user logged in'
    end

    context 'with admin logged in' do
      login_admin
      it_behaves_like 'access to :bad_smell_by_nfunctions_filtered with user logged in'
    end
  end
end