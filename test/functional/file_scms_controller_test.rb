require 'test_helper'

class FileScmsControllerTest < ActionController::TestCase
  setup do
    @file_scm = file_scms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:file_scms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create file_scm" do
    assert_difference('FileScm.count') do
      post :create, file_scm: { file_name: @file_scm.file_name, repository_id: @file_scm.repository_id }
    end

    assert_redirected_to file_scm_path(assigns(:file_scm))
  end

  test "should show file_scm" do
    get :show, id: @file_scm
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @file_scm
    assert_response :success
  end

  test "should update file_scm" do
    put :update, id: @file_scm, file_scm: { file_name: @file_scm.file_name, repository_id: @file_scm.repository_id }
    assert_redirected_to file_scm_path(assigns(:file_scm))
  end

  test "should destroy file_scm" do
    assert_difference('FileScm.count', -1) do
      delete :destroy, id: @file_scm
    end

    assert_redirected_to file_scms_path
  end
end
