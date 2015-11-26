class ProjectsController < ApplicationController
  before_action :require_login

  def index
    @projects = current_user.projects
  end

  def new
    @project = current_user.projects.new
  end

  def create
    @project = current_user.projects.new(project_params)
    if @project.save
      @project.users << current_user
      redirect_to project_issues_path(@project)
    else
      render :new
    end
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end
end
