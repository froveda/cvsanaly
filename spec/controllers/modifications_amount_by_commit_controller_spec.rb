require 'rails_helper'

describe ModificationsAmountByCommitController do

  describe 'with guest user' do
    context 'Get #modifications_amount_by_commit' do
      it_behaves_like 'redirect to login path when no user is logged in', :modifications_amount_by_commit
    end

    context 'Get #modifications_amount_by_commit_filtered' do
      it_behaves_like 'redirect to login path when no user is logged in', :modifications_amount_by_commit_filtered
    end
  end

  describe 'with user logged in' do
    login_user

    it_behaves_like 'access to :modifications_amount_by_commit_filtered with user logged in'
  end

  describe 'with admin logged in' do
    login_admin

    it_behaves_like 'access to :modifications_amount_by_commit_filtered with user logged in'
  end

end