require "rails_helper"

describe IssuesController do
  describe "#index" do
    it 'shows open issues of current user if no filters passed' do
      our_user = create(:user)
      other_user = create(:user)
      our_open_issue = create(:issue, user: our_user, title: 'our open issue')
      our_completed_issue = create(:completed_issue, user: our_user, title: 'our completed issue')
      other_issue = create(:issue, user: other_user, title: 'other issue')

      sign_in_as our_user
      get :index

      expect(assigns(:issues).map(&:title)).to eq ["our open issue"]
    end

    it 'shows completed if proper filter passed' do
      our_user = create(:user)
      other_user = create(:user)
      our_open_issue = create(:issue, user: our_user, title: 'our open issue')
      our_completed_issue = create(:completed_issue, user: our_user, title: 'our completed issue')
      other_issue = create(:issue, user: other_user, title: 'other issue')

      sign_in_as our_user
      get :index, { status: "completed" }

      expect(assigns(:issues).map(&:title)).to eq ["our completed issue"]
    end
  end

  describe "#create" do
    it "creates issues for current user" do
      user = create(:user)

      sign_in_as user
      post :create, issue: { title: "IssueOne" }

      expect(Issue.last.user).to eq user
    end
  end

  describe "#show" do
    it "shows requested issue" do
      user = create(:user)
      issue = create(:issue, user: user, title: 'our issue')

      sign_in_as user
      get :show, id: issue.id

      expect(assigns(:issue).title).to eq "our issue"
    end
  end

  describe "#destroy" do
    it "deletes requested issue" do
      user = create(:user)
      issue = create(:issue, user: user, title: 'our issue')

      sign_in_as user
      expect { delete :destroy, id: issue.id }.to change {
        user.issues.count }.by(-1)
    end
  end

  describe "#update" do
    it "updates requested issue of current user" do
      user = create(:user)
      issue = create(:issue, user: user, title: 'old_title')

      sign_in_as user
      put :update, id: issue.id, issue: { title: "updated_title"}

      expect(assigns(:issue).title).to eq "updated_title"
    end
  end
end
