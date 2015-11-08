require "rails_helper"

describe IssuesController do
  describe "#index" do
    it 'shows open issues of current project if no filters passed' do
      our_user = create(:user)

      one_project = create(:project, name: "Name1", users: [our_user])
      another_project = create(:project, name: "Name2", users: [our_user])

      our_open_issue = create(:issue, user: our_user, project: one_project, title: 'our open issue')
      our_completed_issue = create(:completed_issue, user: our_user, project: one_project, title: 'our completed issue')
      other_issue = create(:issue, user: our_user, project: another_project, title: 'other issue')

      sign_in_as our_user
      get :index, project_id: one_project

      expect(assigns(:issues).map(&:title)).to eq ["our open issue"]
    end

    it 'shows completed if proper filter passed' do
      our_user = create(:user)

      one_project = create(:project, name: "Name1", users: [our_user])
      another_project = create(:project, name: "Name2", users: [our_user])

      our_open_issue = create(:issue, user: our_user, project: one_project, title: 'our open issue')
      our_completed_issue = create(:completed_issue, user: our_user, project: one_project, title: 'our completed issue')
      other_issue = create(:issue, user: our_user, project: another_project, title: 'other issue')

      sign_in_as our_user
      get :index, { project_id: one_project, status: "completed" }

      expect(assigns(:issues).map(&:title)).to eq ["our completed issue"]
    end
  end

  describe "#create" do
    it "creates issues for current user and project" do
      user = create(:user)
      project = create(:project, name: "Name1", users: [user])

      sign_in_as user
      post :create, { project_id: project, issue: { title: "IssueOne", project_id: project } }

      expect(Issue.last.user).to eq user
      expect(Issue.last.project).to eq project
    end
  end

  describe "#show" do
    it "shows requested issue" do
      user = create(:user)
      project = create(:project, name: "Name1", users: [user])
      issue = create(:issue, user: user, project: project, title: 'our issue')

      sign_in_as user
      get :show, project_id: project, id: issue.id

      expect(assigns(:issue).title).to eq "our issue"
    end
  end

  describe "#destroy" do
    it "deletes requested issue" do
      user = create(:user)
      project = create(:project, users: [user])
      issue = create(:issue, user: user, project: project, title: 'our issue')

      sign_in_as user
      expect { delete :destroy, project_id: project, id: issue.id }.to change {
        user.issues.count }.by(-1)
    end
  end

  describe "#update" do
    it "updates requested issue of current user" do
      user = create(:user)
      project = create(:project, users: [user])
      issue = create(:issue, user: user, project: project, title: 'old_title')

      sign_in_as user
      put :update, project_id: project, id: issue.id, issue: { title: "updated_title"}

      expect(assigns(:issue).title).to eq "updated_title"
    end
  end
end
