require 'test_helper'

class FileCopiesControllerTest < ActionController::TestCase
  setup do
    @file_copy = file_copies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:file_copies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create file_copy" do
    assert_difference('FileCopy.count') do
      post :create, file_copy: { action_id: @file_copy.action_id, from_commit_id: @file_copy.from_commit_id, from_id: @file_copy.from_id, new_file_name: @file_copy.new_file_name, to_id: @file_copy.to_id }
    end

    assert_redirected_to file_copy_path(assigns(:file_copy))
  end

  test "should show file_copy" do
    get :show, id: @file_copy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @file_copy
    assert_response :success
  end

  test "should update file_copy" do
    put :update, id: @file_copy, file_copy: { action_id: @file_copy.action_id, from_commit_id: @file_copy.from_commit_id, from_id: @file_copy.from_id, new_file_name: @file_copy.new_file_name, to_id: @file_copy.to_id }
    assert_redirected_to file_copy_path(assigns(:file_copy))
  end

  test "should destroy file_copy" do
    assert_difference('FileCopy.count', -1) do
      delete :destroy, id: @file_copy
    end

    assert_redirected_to file_copies_path
  end
end
