require "rails_helper"

describe CompletionsController do
  describe "#create" do
    it 'should make issue completed' do
      user = create(:user)
      issue = create(:issue, user: user)

      sign_in_as user
      issue.complete!

      expect(issue.completed?).to be_truthy
    end
  end

  describe "#destroy" do
    it "should make issue open" do
      user = create(:user)
      completed_issue = create(:completed_issue, user: user)

      sign_in_as user
      completed_issue.open!

      expect(completed_issue.open?).to be_truthy
    end
  end
end
