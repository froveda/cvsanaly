require 'rails_helper'

describe WelcomeController do

  describe 'GET #home' do
    context 'with no user logged in' do
      it 'does not have a current_user' do
        expect(subject.current_user).to eq(nil)
      end

      it 'Redirects to login path' do
        get :home
        expect(response).to redirect_to new_user_session_path
      end
    end

    context 'with user logged in' do
      login_user
      it_behaves_like 'access to home with user logged in'
    end

    context 'with admin user logged in' do
      login_admin
      it_behaves_like 'access to home with user logged in'
    end
  end

end