class ProjectsController < ApplicationController
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
      add_tags
      redirect_to project_issues_path(@project)
    else
      render :new
    end
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end

  def add_tags
    bug = Tag.create!(name: "bug", color: "e11d21", project_id: @project)
    feature = Tag.create!(name: "feature", color: "009800", project_id: @project)
    @project.tags << bug
    @project.tags << feature
  end
end
