require 'test_helper'

class FileLinksControllerTest < ActionController::TestCase
  setup do
    @file_link = file_links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:file_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create file_link" do
    assert_difference('FileLink.count') do
      post :create, file_link: { commit_id: @file_link.commit_id, file_id: @file_link.file_id, file_path: @file_link.file_path, parent_id: @file_link.parent_id }
    end

    assert_redirected_to file_link_path(assigns(:file_link))
  end

  test "should show file_link" do
    get :show, id: @file_link
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @file_link
    assert_response :success
  end

  test "should update file_link" do
    put :update, id: @file_link, file_link: { commit_id: @file_link.commit_id, file_id: @file_link.file_id, file_path: @file_link.file_path, parent_id: @file_link.parent_id }
    assert_redirected_to file_link_path(assigns(:file_link))
  end

  test "should destroy file_link" do
    assert_difference('FileLink.count', -1) do
      delete :destroy, id: @file_link
    end

    assert_redirected_to file_links_path
  end
end
