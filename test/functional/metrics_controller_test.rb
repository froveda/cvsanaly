require 'test_helper'

class MetricsControllerTest < ActionController::TestCase
  setup do
    @metric = metrics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:metrics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create metric" do
    assert_difference('Metric.count') do
      post :create, metric: { commit_id: @metric.commit_id, file_id: @metric.file_id, halstead_length: @metric.halstead_length, halstead_level: @metric.halstead_level, halstead_md: @metric.halstead_md, halstead_vol: @metric.halstead_vol, lang: @metric.lang, lblank: @metric.lblank, lcomment: @metric.lcomment, loc: @metric.loc, mccabe_max: @metric.mccabe_max, mccabe_mean: @metric.mccabe_mean, mccabe_median: @metric.mccabe_median, mccabe_min: @metric.mccabe_min, mccabe_sum: @metric.mccabe_sum, ncomment: @metric.ncomment, nfunctions: @metric.nfunctions, sloc: @metric.sloc }
    end

    assert_redirected_to metric_path(assigns(:metric))
  end

  test "should show metric" do
    get :show, id: @metric
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @metric
    assert_response :success
  end

  test "should update metric" do
    put :update, id: @metric, metric: { commit_id: @metric.commit_id, file_id: @metric.file_id, halstead_length: @metric.halstead_length, halstead_level: @metric.halstead_level, halstead_md: @metric.halstead_md, halstead_vol: @metric.halstead_vol, lang: @metric.lang, lblank: @metric.lblank, lcomment: @metric.lcomment, loc: @metric.loc, mccabe_max: @metric.mccabe_max, mccabe_mean: @metric.mccabe_mean, mccabe_median: @metric.mccabe_median, mccabe_min: @metric.mccabe_min, mccabe_sum: @metric.mccabe_sum, ncomment: @metric.ncomment, nfunctions: @metric.nfunctions, sloc: @metric.sloc }
    assert_redirected_to metric_path(assigns(:metric))
  end

  test "should destroy metric" do
    assert_difference('Metric.count', -1) do
      delete :destroy, id: @metric
    end

    assert_redirected_to metrics_path
  end
end
