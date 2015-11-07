require "rails_helper"

feature "User updates the requested issue" do
  scenario "of this user" do
    user = create(:user)
    project = create(:project, name: "Name1", users: [user])
    issue = create(:issue, user: user, project: project, title: "IssueOne")

    visit project_issue_path(project, issue, as: user)
    click_on I18n.t("issues.show.edit")

    fill_in Issue.human_attribute_name("title"), with: "IssueUpdate"
    click_on I18n.t("issues.new.save")

    expect(page).to have_content("IssueUpdate")
  end
end
