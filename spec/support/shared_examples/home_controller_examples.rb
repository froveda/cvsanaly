shared_examples_for 'access to home with user logged in' do
  it 'has a current_user' do
    expect(subject.current_user).to_not eq(nil)
  end

  it 'renders the :home template' do
    get :home
    expect(response).to render_template :home
  end
end