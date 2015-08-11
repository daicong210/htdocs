#encoding:utf-8
class PerformancesController < ApplicationController
  # GET /performances
  # GET /performances.json

  menu_item :performances
  before_filter :find_project_by_project_id, :authorize

  helper :projects
  include ProjectsHelper
  helper :queries
  include QueriesHelper
  helper :sort
  helper :performance_subjects
  include SortHelper
  include Redmine::Export::PDF
  include Redmine::Export::Excel
  include PerformancesHelper
  include PerformanceSubjectsHelper
  def index
      @performances = get_performances_lsit
      if !@performances.blank? then
        @performances.sort! { |a,b| b.date.to_s <=> a.date.to_s }
      end
      @performances_count = @performances.count
      @performances_pages = Paginator.new self, @performances_count, per_page_option, params['page']
      respond_to do |format|
        format.html { render :template => 'performances/index', :layout => !request.xhr? }
        format.atom { render_feed(@performances, :title => "#{@project || Setting.app_title}: #{l(:label_performance_plural)}") }
      end
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  # GET /performances/1
  # GET /performances/1.json
  def show
    @performance = Performance.find(params[:id])
    @department_member = @performance.department_member
    @subjects = @performance.performance_subjects
    session[:performance_id] = params[:id]
    if @department_member.blank?
      render_error({:message => "你当前不属于任何部门，无法建立绩效,请联系管理员！", :status => 416})
    else
      respond_to do |format|
        format.html{ render template: "performances/show"}
        format.json { render json: @performance }
      end
    end
  end

  # GET /performances/new
  # GET /performances/new.json
  def new
    @performance = @project.performances.build
    @priorities = IssuePriority.active

    @performance = Performance.new
    @department_member = User.current.department_member
    if @department_member.blank? then   #无部门
      render_error({:message => "你当前不属于任何部门，无法建立绩效,请联系管理员！", :status => 416})
    else
      @performance.user_id = @department_member.user_id
      @performance.project_id = @project.id
      @performance.department_member_id = @department_member.id
      @performance.status = 0 #新建
      respond_to do |format|
        format.html # new.html.erb
        format.js
        format.json { render json: @performance }
      end
    end
  end

  # GET /performances/1/edit
  def edit
    show
  end

  # POST /performances
  # POST /performances.json
  def create
    @performance = Performance.new(params[:performance])
    if @performance.user_id.blank? then
      render_error({:message => "信息不完整，请重新填写！", :status => 416})
      return
    end
    department_member = DepartmentMember.find_by_user_id(@performance.user_id)
    if department_member.user_id.blank? then
      render_error({:message => "信息不完整，请重新填写！", :status => 416})
      return
    end
    @performance.department_member_id = department_member.id
    @performance.project_id = @project.id
    respond_to do |format|
      if @performance.save
        flash[notice: '绩效创建成功!']
        @performances = Performance.all
        @performances_count = Performance.count
        @performances_pages = Paginator.new self, @performances_count, per_page_option, params['page']
        format.html { redirect_to edit_project_performance_path(@project,@performance) }
        format.json { render json: @performance, status: :created, location: @performance }
      else
        format.html { render action: "new" }
        format.json { render json: @performance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /performances/1
  # PUT /performances/1.json
  def update
    @performance = Performance.find(params[:id])
    ret = @performance.update_attributes(params[:performance])
    if ret
     flash[:notice]="更新成功！"
    else
      flash[:alert]="更新失败！"
    end
    show
  end

  # DELETE /performances/1
  # DELETE /performances/1.json
  def destroy
    @performance = Performance.find(params[:id])
    @performance.destroy
    respond_to do |format|
      format.html{redirect_to project_performances_path(@project)}
    end
  end

  def down
    send_performance_excel(params[:performance_id])
  end

  #批量导出excel
  def export_excels
    @subject = PerformanceSubject.new
    @priorities = IssuePriority.active
    @member = @project.users.all

    @departments = @project.departments
    respond_to do |format|
      format.js
    end
  end

  def send_excels
    # departments = params[:departments]
    # date =params[:date]
    # date = Date.parse("#{date['day']}/#{date['month']}/#{date['year']}").to_s
    # @size = 0
    # departments.each do |dep|
    #   department = Department.find_by_id(dep)
    #   if !department.blank?
    #     dep_members = department.department_members
    #     if dep_members.any?then
    #       dep_members.each do |value|
    #         sql = "select * from #{Performance.table_name} where department_member_id = #{value.id} and date = '#{date}' "
    #         performance = Performance.find_by_sql(sql)
    #         if performance.any?
    #            performance.each do|pep|
    #              send_performance_excel(pep.id)
    #            end
    #         end
    #       end
    #     end
    # end
    # end
    respond_to do |format|
      format.js
    end
  end
private
  def send_performance_excel(performance_id)
    filepath = create_excel(performance_id)
    if filepath.blank? then
      return false
    end
    io = File.open(filepath)
    io.binmode
    send_data(io.read,
              :filename=>File.basename(filepath),
              :type=>"application/vmd.ms-excel",
              :disposition=>'attachment')
    io.close
    if File.exist? filepath then
      File.delete filepath
    end
    true
  end
  #生成excel文件
  def create_excel(performance_id)
    if performance_id.blank?
      return nil
    end
    performance = Performance.find_by_id(performance_id)
    if performance.blank?
      return nil
    end
    dep = performance.department_member.department.name
    username = "#{performance.department_member.user.name}"
    month = performance.date.strftime("%Y-%m")

    performance_key = PerformanceSubject.find_by_sql("select * from #{PerformanceSubject.table_name} where performance_id=#{performance_id} and subject_type = 1")
    performance_add = PerformanceSubject.find_by_sql("select * from #{PerformanceSubject.table_name} where performance_id=#{performance_id} and subject_type = 2")
    filename ="#{performance.project.name}#{month}月绩效考核-#{username}.xls"
    filepath = "#{Rails.root}/public/#{filename}"

    create_performance_excel(filepath)
    set_main_row_title performance.project.name

    set_performance_info(dep,username,month,performance.leader_mark,get_rating(performance.leader_rating) )
    set_key_subject_title
    if performance_key.any?then
      performance_key.each_with_index do|value,index|
        priority = get_priority_name(value.priority_id)
        add_subject_item(index+1,priority,value.subject,value.aim,value.comment,value.assessment,value.score,value.leader_mark)
      end
    end
    set_add_subject_title
    if performance_add.any?then
      performance_add.each_with_index do|value,index|
        priority = get_priority_name(value.priority_id)
        add_subject_item(index+1,priority,value.subject,value.aim,value.comment,value.assessment,value.score,value.leader_mark)
      end
    end
    add_assessment(performance.self_assessment,performance.leader_assessment)
    close_excel
    return filepath
  end
end
