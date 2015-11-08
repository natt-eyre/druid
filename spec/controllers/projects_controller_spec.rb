require "rails_helper"

describe ProjectsController do
  describe "#index" do
    it 'shows projects of current user' do
      our_user = create(:user)
      other_user = create(:user)
      our_project = create(:project, name: "Our Project", users: [our_user])
      other_project = create(:project, name: "Other Project", users: [other_user])

      sign_in_as our_user
      get :index

      expect(assigns(:projects).map(&:name)).to eq ["Our Project"]
    end
  end

  describe "#create" do
    it "creates projects for current user with default tags" do
      user = create(:user)

      sign_in_as user
      post :create, project: { name: "ProjectOne" }

      expect(Project.last.users).to eq [user]
      expect(user.projects).to eq [Project.last]
      expect(Project.last.tags.count).to eq(2)
    end
  end
end
