shared_examples_for 'redirect to login path when no user is logged in' do |trying_to_access_path|
  context 'with no user logged in' do
    it 'does not have a current_user' do
      expect(subject.current_user).to eq(nil)
    end

    it 'Redirects to login path' do
      get trying_to_access_path
      expect(response).to redirect_to new_user_session_path
    end
  end
end