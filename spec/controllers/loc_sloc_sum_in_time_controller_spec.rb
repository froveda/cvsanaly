require 'rails_helper'

describe LocSlocSumInTimeController do
  describe 'with guest user' do
    context 'Get #loc_sum_by_date' do
      it_behaves_like 'redirect to login path when no user is logged in', :loc_sum_by_date
    end

    context 'Get #loc_sum_by_date_filtered' do
      it_behaves_like 'redirect to login path when no user is logged in', :loc_sum_by_date_filtered
    end
  end

  describe 'with user logged in' do
    login_user
    it_behaves_like 'access to :loc_sum_by_date with user logged in'
    it_behaves_like 'access to :loc_sum_by_date_filtered with user logged in'
  end

  describe 'with admin logged in' do
    login_admin
    it_behaves_like 'access to :loc_sum_by_date with user logged in'
    it_behaves_like 'access to :loc_sum_by_date_filtered with user logged in'
  end
end