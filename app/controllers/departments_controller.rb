#encoding:utf-8
class DepartmentsController < ApplicationController
  # menu_item :department
  #控制跳转后是否还在之前的tab页，例如，设置页下
  menu_item :settings #, :only => [:new, :create, :edit, :update, :destroy]

  #before_filter :find_project_by_project_id, :only => [:new, :create]
  before_filter :find_project_by_project_id, :find_department_if_available, :authorize
#  before_filter :authorize

  helper :sort
  include SortHelper
  helper :watchers


  # GET /departments
  # GET /departments.json
  def index
    # @departments = Department.all
    #
    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.json { render json: @departments }
    # end
    @departments = @project.departments.all
    # show the board if there is only one
    if @departments.size == 1
      @department = @departments.first
      #show
      render :action => 'show', :layout => !request.xhr?
    end
end

  # GET /departments/1
  # GET /departments/1.json
  def show
    redirect_to :controller => "department_members", :action => "show",:department_id=>params[:id]
    # @department = Department.find(params[:id])
    #
    # respond_to do |format|
    #   format.html {
    #     @members_count = @department.department_members.count
    #     @members_pages = Paginator.new self, @members_count, per_page_option, params['page']
    #     @members =  @department.department_members.all(
    #         :limit  =>  @members_pages.items_per_page,
    #         :offset =>  @members_pages.current.offset)
    #
    #     #@members =  @department.department_members
    #     render :action => 'show', :layout => !request.xhr?
    #   }
    # end
  end

  # GET /departments/new
  # GET /departments/new.json
  def new
    @department = @project.departments.build
    @department.safe_attributes = params[:department]
  end

  # GET /departments/1/edit
  def edit
    #@department = Department.find(params[:id])
  end

  # POST /departments
  # POST /departments.json
  def create
    # @department = Department.new(params[:department])
    #
    # respond_to do |format|
    #   if @department.save
    #     format.html { redirect_to @department, notice: 'Department was successfully created.' }
    #     format.json { render json: @department, status: :created, location: @department }
    #   else
    #     format.html { render action: "new" }
    #     format.json { render json: @department.errors, status: :unprocessable_entity }
    #   end
    # end

    @department = @project.departments.build
    @department.safe_attributes = params[:department]
    if @department.save
      flash[:notice] = l(:notice_successful_create)
      redirect_to_settings_in_projects
    else
      render :action => 'new'
    end
  end

  # PUT /departments/1
  # PUT /departments/1.json
  def update
    # @department = Department.find(params[:id])
    #
    # respond_to do |format|
    #   if @department.update_attributes(params[:department])
    #     format.html { redirect_to @department, notice: 'Department was successfully updated.' }
    #     format.json { head :no_content }
    #   else
    #     format.html { render action: "edit" }
    #     format.json { render json: @department.errors, status: :unprocessable_entity }
    #   end
    # end
    @department.safe_attributes = params[:department]
    if @department.save
      redirect_to_settings_in_projects
    else
      render :action => 'edit'
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    # @department = Department.find(params[:id])
    # @department.destroy
    #
    # respond_to do |format|
    #   format.html { redirect_to departments_url }
    #   format.json { head :no_content }
    # end
    @department.destroy
    redirect_to_settings_in_projects
  end

  private

  def redirect_to_settings_in_projects
    redirect_to :controller => 'projects', :action => 'settings', :id => @project, :tab => 'departments'
  end

  def find_department_if_available
    @department = @project.departments.find(params[:id]) if params[:id]
  rescue ActiveRecord::RecordNotFound
    render_404
  end
end
