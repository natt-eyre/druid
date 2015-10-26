class CompletionsController < ApplicationController
  before_action :require_login

  def create
    @issue = Issue.find(params[:issue_id])
    @issue.complete!
    redirect_to issue_path(@issue)
  end
end
