#encoding:utf-8
class DepartmentMembersController < ApplicationController
  # GET /department_members
  # GET /department_members.json

  menu_item :settings
  before_filter :find_project_by_project_id, :authorize
  helper :sort
  include SortHelper
  helper :watchers
  helper :Departments
  def index
  end

  # GET /department_members/1
  # GET /department_members/1.json
  def show
    @department = Department.find(params[:department_id])
    respond_to do |format|
      format.html {
        @members_count = @department.department_members.count
        @members_pages = Paginator.new self, @members_count, per_page_option, params['page']
        @members =  @department.department_members.all(
            :limit  =>  @members_pages.items_per_page,
            :offset =>  @members_pages.current.offset)
        @member ||=  @department.department_members.new
        render :action => 'show', :layout => !request.xhr?
      }
    end
  end

  # GET /department_members/new
  # GET /department_members/new.json
  def new
  end

  # GET /department_members/1/edit
  def edit
  end

  # POST /department_members
  # POST /department_members.json
  def create
    members = []
    @created = false
    @department = Department.find(params[:department_id])
    if params[:members]
      if params[:members][:user_ids] && !@department.blank?
        attrs = params[:members].dup
        user_ids = attrs.delete(:user_ids)
        user_ids.each do |user_id|
          members << DepartmentMember.new(:user_id => user_id, :department_id =>params[:department_id],:leader=>params[:leader])
        end
        @department.department_members << members
        @created = true
      end
    end

    respond_to do |format|
      format.js {
        @created
        @department
        @members_count = @department.department_members.count
        @members_pages = Paginator.new self, @members_count, per_page_option, params['page']
        @members =  @department.department_members.all(
            :limit  =>  @members_pages.items_per_page,
            :offset =>  @members_pages.current.offset)
        @member ||=  @department.department_members.new
      }
    end
  end

  # PUT /department_members/1
  # PUT /department_members/1.json
  def update
    @department_member = DepartmentMember.find(params[:id])
    updated = @department_member.update_attributes(params[:department_member])
    @department = @department_member.department
    @members = @department.department_members
    respond_to do |format|
      format.js
      format.api {
        if updated
          render_api_ok
        else
          render_validation_errors(@department_member)
        end
      }
    end
  end

  # DELETE /department_members/1
  # DELETE /department_members/1.json
  def destroy
    @department_member = DepartmentMember.find(params[:id])
    @department = Department.find(@department_member.department_id)
    params[:department_id] = @department_member.department_id
    @member ||=  @department.department_members.new
    @members_count = @department.department_members.count
    @members_pages = Paginator.new self, @members_count, per_page_option, params['page']
    @members =  @department.department_members.all(
        :limit  =>  @members_pages.items_per_page,
        :offset =>  @members_pages.current.offset)
    @members =  @department.department_members
    if request.delete?
      @department_member.destroy
    end
    respond_to do |format|
        format.js
     end
  end

  def autocomplete
    @principals = Principal.active.not_member_of_department(@project).like(params[:q]).all(:limit => 100)
    render :layout => false
  end
end
