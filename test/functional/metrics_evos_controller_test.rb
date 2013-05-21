require 'test_helper'

class MetricsEvosControllerTest < ActionController::TestCase
  setup do
    @metrics_evo = metrics_evos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:metrics_evos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create metrics_evo" do
    assert_difference('MetricsEvo.count') do
      post :create, metrics_evo: { branch_id: @metrics_evo.branch_id, date: @metrics_evo.date, files: @metrics_evo.files, loc: @metrics_evo.loc, sloc: @metrics_evo.sloc }
    end

    assert_redirected_to metrics_evo_path(assigns(:metrics_evo))
  end

  test "should show metrics_evo" do
    get :show, id: @metrics_evo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @metrics_evo
    assert_response :success
  end

  test "should update metrics_evo" do
    put :update, id: @metrics_evo, metrics_evo: { branch_id: @metrics_evo.branch_id, date: @metrics_evo.date, files: @metrics_evo.files, loc: @metrics_evo.loc, sloc: @metrics_evo.sloc }
    assert_redirected_to metrics_evo_path(assigns(:metrics_evo))
  end

  test "should destroy metrics_evo" do
    assert_difference('MetricsEvo.count', -1) do
      delete :destroy, id: @metrics_evo
    end

    assert_redirected_to metrics_evos_path
  end
end
