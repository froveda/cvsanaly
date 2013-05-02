require 'test_helper'

class ActionFilesControllerTest < ActionController::TestCase
  setup do
    @action_file = action_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:action_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create action_file" do
    assert_difference('ActionFile.count') do
      post :create, action_file: { action_id: @action_file.action_id, action_type: @action_file.action_type, commit_id: @action_file.commit_id, file_id: @action_file.file_id }
    end

    assert_redirected_to action_file_path(assigns(:action_file))
  end

  test "should show action_file" do
    get :show, id: @action_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @action_file
    assert_response :success
  end

  test "should update action_file" do
    put :update, id: @action_file, action_file: { action_id: @action_file.action_id, action_type: @action_file.action_type, commit_id: @action_file.commit_id, file_id: @action_file.file_id }
    assert_redirected_to action_file_path(assigns(:action_file))
  end

  test "should destroy action_file" do
    assert_difference('ActionFile.count', -1) do
      delete :destroy, id: @action_file
    end

    assert_redirected_to action_files_path
  end
end
