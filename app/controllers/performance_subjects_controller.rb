class PerformanceSubjectsController < ApplicationController
  # GET /performance_subjects
  # GET /performance_subjects.json
  before_filter :find_project_by_project_id, :authorize

  helper :custom_fields
  helper :projects
  helper :performances
  include ProjectsHelper
  helper :queries
  include QueriesHelper
  helper :sort
  include SortHelper
  include Redmine::Export::PDF
  include PerformancesHelper
  include PerformanceSubjectsHelper
  def index
    @performance_subjects = PerformanceSubject.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @performance_subjects }
    end
  end

  # GET /performance_subjects/1
  # GET /performance_subjects/1.json
  def show
    @performance_subject = PerformanceSubject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @performance_subject }
    end
  end

  # GET /performance_subjects/new
  # GET /performance_subjects/new.json
  def new
    @subject = PerformanceSubject.new
    @priorities = IssuePriority.active

    respond_to do |format|
      format.js
    end
  end

  # GET /performance_subjects/1/edit
  def edit
    @subject = PerformanceSubject.find(params[:id])
    @priorities = IssuePriority.active
    @socre = @subject.score
    respond_to do |format|
      format.html # new.html.erb
      format.js
    end
  end

  # POST /performance_subjects
  # POST /performance_subjects.json
  def create
    @subject = PerformanceSubject.new(params[:performance_subject])
    @socre = @subject.score
    @priorities = IssuePriority.active

    @performance = Performance.find_by_id(@subject.performance_id)
    @department_member = @performance.department_member
    if request.post?
      if  @subject.save
        @performance.update_attribute(:leader_mark,get_leader_mark_sum(@subject.performance_id))
        @subjects = PerformanceSubject.find_all_by_performance_id(@subject.performance_id)
        respond_to do |format|
          format.js
        end
      else
        respond_to do |format|
          format.js { render :action => 'new'}
        end
      end
    end
  end

  # PUT /performance_subjects/1
  # PUT /performance_subjects/1.json
  def update
    @subject = PerformanceSubject.find(params[:id])
    @socre = @subject.score
    ret = @subject.update_attributes(params[:performance_subject])
    @performance = Performance.find_by_id(@subject.performance_id)
    @performance.update_attribute(:leader_mark,get_leader_mark_sum(@subject.performance_id))
    @subjects = PerformanceSubject.find_all_by_performance_id(@subject.performance_id)
    @priorities = IssuePriority.active
    @department_member = @performance.department_member
    if ret
      respond_to do |format|
         format.js
      end
    else
      respond_to do |format|
        format.js { render :action => 'new'}
      end
    end

  end

  # DELETE /performance_subjects/1
  # DELETE /performance_subjects/1.json
  def destroy
    @performance_subject = PerformanceSubject.find(params[:id])
    performance_id = @performance_subject.performance_id
    @performance_subject.destroy
    @subjects = PerformanceSubject.find_all_by_performance_id(performance_id)
    @performance = Performance.find_by_id(performance_id)
    @performance.update_attribute(:leader_mark,get_leader_mark_sum(performance_id))
    @department_member = @performance.department_member
    respond_to do |format|
      format.js
    end
  end
end
