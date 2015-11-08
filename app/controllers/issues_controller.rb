class IssuesController < ApplicationController
  before_action :require_login
  before_action :get_project
  before_action :get_issue, only: [ :show, :edit, :destroy, :update ]

  def index
    if params["status"] == "completed"
      @issues = @project.issues.completed
    else
      @open = true
      @issues = @project.issues.open
    end
  end

  def new
    @issue = @project.issues.new
  end

  def edit
  end

  def create
    @issue = current_user.issues.new(issue_params)
    if @issue.save
      redirect_to project_issues_path(@project)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @issue.destroy!
    redirect_to project_issues_path(@project)
  end

  def update
    if @issue.update_attributes(issue_params)
      redirect_to project_issues_path(@project)
    else
      render :edit
    end
  end

  private

  def issue_params
    params.require(:issue).permit(:title, :description, :project_id)
  end

  def get_project
    @project = current_user.projects.find(params[:project_id])
  end

  def get_issue
    @issue = @project.issues.find(params[:id])
  end
end
