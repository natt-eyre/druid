require "rails_helper"

describe IssuesController do
  describe "#index" do
    it 'shows issues' do
      issue = create(:issue, title: 'our issue')
      get :index

      expect(assigns(:issues).map(&:title)).to eq ["our issue"]
    end
  end

  describe "#create" do
    it "creates issues" do
      post :create, issue: { title: "IssueOne" }

      expect(Issue.last.title).to eq "IssueOne"
    end
  end

  describe "#show" do
    it "shows requested issue" do
      issue = create(:issue, title: 'our issue')
      get :show, id: issue.id

      expect(assigns(:issue).title).to eq "our issue"
    end
  end
end
