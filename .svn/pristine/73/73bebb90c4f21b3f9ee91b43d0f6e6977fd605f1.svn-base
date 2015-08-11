require 'test_helper'

class DepartmentMembersControllerTest < ActionController::TestCase
  setup do
    @department_member = department_members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:department_members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create department_member" do
    assert_difference('DepartmentMember.count') do
      post :create, department_member: { department_id: @department_member.department_id, leader: @department_member.leader, user_id: @department_member.user_id }
    end

    assert_redirected_to department_member_path(assigns(:department_member))
  end

  test "should show department_member" do
    get :show, id: @department_member
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @department_member
    assert_response :success
  end

  test "should update department_member" do
    put :update, id: @department_member, department_member: { department_id: @department_member.department_id, leader: @department_member.leader, user_id: @department_member.user_id }
    assert_redirected_to department_member_path(assigns(:department_member))
  end

  test "should destroy department_member" do
    assert_difference('DepartmentMember.count', -1) do
      delete :destroy, id: @department_member
    end

    assert_redirected_to department_members_path
  end
end
