require 'test_helper'

class MonthlySummariesControllerTest < ActionController::TestCase
  setup do
    @monthly_summary = monthly_summaries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:monthly_summaries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create monthly_summary" do
    assert_difference('MonthlySummary.count') do
      post :create, monthly_summary: { amount: @monthly_summary.amount, begin_at: @monthly_summary.begin_at, carryover_amount: @monthly_summary.carryover_amount, end_at: @monthly_summary.end_at, month: @monthly_summary.month, this_month_amount: @monthly_summary.this_month_amount, year: @monthly_summary.year }
    end

    assert_redirected_to monthly_summary_path(assigns(:monthly_summary))
  end

  test "should show monthly_summary" do
    get :show, id: @monthly_summary
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @monthly_summary
    assert_response :success
  end

  test "should update monthly_summary" do
    patch :update, id: @monthly_summary, monthly_summary: { amount: @monthly_summary.amount, begin_at: @monthly_summary.begin_at, carryover_amount: @monthly_summary.carryover_amount, end_at: @monthly_summary.end_at, month: @monthly_summary.month, this_month_amount: @monthly_summary.this_month_amount, year: @monthly_summary.year }
    assert_redirected_to monthly_summary_path(assigns(:monthly_summary))
  end

  test "should destroy monthly_summary" do
    assert_difference('MonthlySummary.count', -1) do
      delete :destroy, id: @monthly_summary
    end

    assert_redirected_to monthly_summaries_path
  end
end
