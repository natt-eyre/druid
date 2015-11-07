class CompletionsController < ApplicationController
  before_action :require_login

  def create
    @issue = Issue.find(params[:issue_id])
    @issue.complete!
    @project = @issue.project
    redirect_to project_issue_path(@project, @issue)
  end

  def destroy
    @issue = Issue.find(params[:issue_id])
    @issue.open!
    @project = @issue.project
    redirect_to project_issue_path(@project, @issue)
  end
end
