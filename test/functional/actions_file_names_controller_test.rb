require 'test_helper'

class ActionsFileNamesControllerTest < ActionController::TestCase
  setup do
    @actions_file_name = actions_file_names(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:actions_file_names)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create actions_file_name" do
    assert_difference('ActionsFileName.count') do
      post :create, actions_file_name: { commit_id: @actions_file_name.commit_id, file_id: @actions_file_name.file_id, new_file_name: @actions_file_name.new_file_name, type: @actions_file_name.type }
    end

    assert_redirected_to actions_file_name_path(assigns(:actions_file_name))
  end

  test "should show actions_file_name" do
    get :show, id: @actions_file_name
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @actions_file_name
    assert_response :success
  end

  test "should update actions_file_name" do
    put :update, id: @actions_file_name, actions_file_name: { commit_id: @actions_file_name.commit_id, file_id: @actions_file_name.file_id, new_file_name: @actions_file_name.new_file_name, type: @actions_file_name.type }
    assert_redirected_to actions_file_name_path(assigns(:actions_file_name))
  end

  test "should destroy actions_file_name" do
    assert_difference('ActionsFileName.count', -1) do
      delete :destroy, id: @actions_file_name
    end

    assert_redirected_to actions_file_names_path
  end
end
