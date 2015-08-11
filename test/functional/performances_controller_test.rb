require 'test_helper'

class PerformancesControllerTest < ActionController::TestCase
  setup do
    @performance = performances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:performances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create performance" do
    assert_difference('Performance.count') do
      post :create, performance: { date: @performance.date, department_member_id: @performance.department_member_id, leader_assessment: @performance.leader_assessment, leader_mark: @performance.leader_mark, leader_rating: @performance.leader_rating, project_id: @performance.project_id, self_assessment: @performance.self_assessment, self_mark: @performance.self_mark, status: @performance.status, user_id: @performance.user_id }
    end

    assert_redirected_to performance_path(assigns(:performance))
  end

  test "should show performance" do
    get :show, id: @performance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @performance
    assert_response :success
  end

  test "should update performance" do
    put :update, id: @performance, performance: { date: @performance.date, department_member_id: @performance.department_member_id, leader_assessment: @performance.leader_assessment, leader_mark: @performance.leader_mark, leader_rating: @performance.leader_rating, project_id: @performance.project_id, self_assessment: @performance.self_assessment, self_mark: @performance.self_mark, status: @performance.status, user_id: @performance.user_id }
    assert_redirected_to performance_path(assigns(:performance))
  end

  test "should destroy performance" do
    assert_difference('Performance.count', -1) do
      delete :destroy, id: @performance
    end

    assert_redirected_to performances_path
  end
end
