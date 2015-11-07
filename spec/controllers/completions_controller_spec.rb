require "rails_helper"

describe CompletionsController do
  describe "#create" do
    it 'should make issue completed' do
      user = create(:user)
      project = create(:project, name: "Name1", users: [user])
      issue = create(:issue, project: project, user: user)

      sign_in_as user
      issue.complete!

      expect(issue.completed?).to be_truthy
    end
  end

  describe "#destroy" do
    it "should make issue open" do
      user = create(:user)
      project = create(:project, name: "Name1", users: [user])
      completed_issue = create(:completed_issue, project: project, user: user)

      sign_in_as user
      completed_issue.open!

      expect(completed_issue.open?).to be_truthy
    end
  end
end
