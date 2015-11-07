require "rails_helper"

feature "User views the requested issue" do
  scenario "of this user" do
    user = create(:user)
    project = create(:project, name: "Name1", users: [user])
    issue = create(:issue, user: user, project: project, title: "IssueOne")

    visit project_issue_path(project, issue, as: user)
    expect(page).to have_content("IssueOne")
  end
end
