require 'test_helper'

class ScmlogsControllerTest < ActionController::TestCase
  setup do
    @scmlog = scmlogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scmlogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scmlog" do
    assert_difference('Scmlog.count') do
      post :create, scmlog: { author_id: @scmlog.author_id, committer_id: @scmlog.committer_id, composed_rev: @scmlog.composed_rev, date: @scmlog.date, message: @scmlog.message, repository_id: @scmlog.repository_id, rev: @scmlog.rev }
    end

    assert_redirected_to scmlog_path(assigns(:scmlog))
  end

  test "should show scmlog" do
    get :show, id: @scmlog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scmlog
    assert_response :success
  end

  test "should update scmlog" do
    put :update, id: @scmlog, scmlog: { author_id: @scmlog.author_id, committer_id: @scmlog.committer_id, composed_rev: @scmlog.composed_rev, date: @scmlog.date, message: @scmlog.message, repository_id: @scmlog.repository_id, rev: @scmlog.rev }
    assert_redirected_to scmlog_path(assigns(:scmlog))
  end

  test "should destroy scmlog" do
    assert_difference('Scmlog.count', -1) do
      delete :destroy, id: @scmlog
    end

    assert_redirected_to scmlogs_path
  end
end
