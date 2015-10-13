class IssuesController < ApplicationController
  before_action :require_login

  def index
    @issues = current_user.issues
  end

  def new
    @issue = Issue.new
  end

  def edit
    @issue = current_user.issues.find(params[:id])
  end

  def create
    @issue = current_user.issues.new(issue_params)
    if @issue.save
      redirect_to @issue
    else
      render :new
    end
  end

  def show
    @issue = Issue.find(params[:id])
    if @issue.user != current_user
      redirect_to issues_path
    end
  end

  def destroy
    issue = current_user.issues.find(params[:id])
    issue.destroy!
    redirect_to root_path
  end

  def update
    @issue = current_user.issues.find(params[:id])
    if @issue.update_attributes(issue_params)
      redirect_to @issue
    else
      render :edit
    end
  end

  private

  def issue_params
    params.require(:issue).permit(:title, :description)
  end
end
