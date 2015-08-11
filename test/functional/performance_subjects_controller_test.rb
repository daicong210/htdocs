require 'test_helper'

class PerformanceSubjectsControllerTest < ActionController::TestCase
  setup do
    @performance_subject = performance_subjects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:performance_subjects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create performance_subject" do
    assert_difference('PerformanceSubject.count') do
      post :create, performance_subject: { aim: @performance_subject.aim, assessment: @performance_subject.assessment, comment: @performance_subject.comment, leader_mark: @performance_subject.leader_mark, priority_id: @performance_subject.priority_id, score: @performance_subject.score, subject: @performance_subject.subject, type: @performance_subject.type }
    end

    assert_redirected_to performance_subject_path(assigns(:performance_subject))
  end

  test "should show performance_subject" do
    get :show, id: @performance_subject
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @performance_subject
    assert_response :success
  end

  test "should update performance_subject" do
    put :update, id: @performance_subject, performance_subject: { aim: @performance_subject.aim, assessment: @performance_subject.assessment, comment: @performance_subject.comment, leader_mark: @performance_subject.leader_mark, priority_id: @performance_subject.priority_id, score: @performance_subject.score, subject: @performance_subject.subject, type: @performance_subject.type }
    assert_redirected_to performance_subject_path(assigns(:performance_subject))
  end

  test "should destroy performance_subject" do
    assert_difference('PerformanceSubject.count', -1) do
      delete :destroy, id: @performance_subject
    end

    assert_redirected_to performance_subjects_path
  end
end
