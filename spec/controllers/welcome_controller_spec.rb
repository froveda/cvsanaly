require 'rails_helper'

describe WelcomeController do

  describe 'GET #home' do
    it_behaves_like 'redirect to login path when no user is logged in', :home

    context 'with user logged in' do
      login_user
      it_behaves_like 'access to :home with user logged in'
    end

    context 'with admin user logged in' do
      login_admin
      it_behaves_like 'access to :home with user logged in'
    end
  end

end