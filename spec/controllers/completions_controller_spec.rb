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
end
