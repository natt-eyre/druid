class IssuesController < ApplicationController
  before_action :require_login

  def index
    @issues = current_user.issues
  end

  def new
    @issue = Issue.new
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

  private

  def issue_params
    params.require(:issue).permit(:title, :description)
  end
end
