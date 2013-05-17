require 'test_helper'

class CommitsLinesControllerTest < ActionController::TestCase
  setup do
    @commits_line = commits_lines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:commits_lines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create commits_line" do
    assert_difference('CommitsLine.count') do
      post :create, commits_line: { added: @commits_line.added, commit_id: @commits_line.commit_id, removed: @commits_line.removed }
    end

    assert_redirected_to commits_line_path(assigns(:commits_line))
  end

  test "should show commits_line" do
    get :show, id: @commits_line
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @commits_line
    assert_response :success
  end

  test "should update commits_line" do
    put :update, id: @commits_line, commits_line: { added: @commits_line.added, commit_id: @commits_line.commit_id, removed: @commits_line.removed }
    assert_redirected_to commits_line_path(assigns(:commits_line))
  end

  test "should destroy commits_line" do
    assert_difference('CommitsLine.count', -1) do
      delete :destroy, id: @commits_line
    end

    assert_redirected_to commits_lines_path
  end
end
