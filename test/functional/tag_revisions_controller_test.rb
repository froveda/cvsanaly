require 'test_helper'

class TagRevisionsControllerTest < ActionController::TestCase
  setup do
    @tag_revision = tag_revisions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tag_revisions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tag_revision" do
    assert_difference('TagRevision.count') do
      post :create, tag_revision: { commit_id: @tag_revision.commit_id, tag_id: @tag_revision.tag_id }
    end

    assert_redirected_to tag_revision_path(assigns(:tag_revision))
  end

  test "should show tag_revision" do
    get :show, id: @tag_revision
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tag_revision
    assert_response :success
  end

  test "should update tag_revision" do
    put :update, id: @tag_revision, tag_revision: { commit_id: @tag_revision.commit_id, tag_id: @tag_revision.tag_id }
    assert_redirected_to tag_revision_path(assigns(:tag_revision))
  end

  test "should destroy tag_revision" do
    assert_difference('TagRevision.count', -1) do
      delete :destroy, id: @tag_revision
    end

    assert_redirected_to tag_revisions_path
  end
end
