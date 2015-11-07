require "rails_helper"

feature "User marks issue as done" do
  scenario "In Issue-show view" do
    user = create(:user)
    project = create(:project, name: "Name1", users: [user])
    issue = create(:issue, user: user, project: project, title: "IssueOne")

    visit project_issue_path(project, issue, as: user)
    click_on I18n.t("issues.show.donebtn")

    expect(page).not_to have_link(I18n.t("issues.show.donebtn"))
    expect(page).to have_link(I18n.t("issues.show.reopen"))

    visit project_issues_path(project, as: user)
    expect(page).not_to have_content("IssueOne")

    click_on I18n.t("issues.index.completed")
    expect(page).to have_content("IssueOne")
  end
end
