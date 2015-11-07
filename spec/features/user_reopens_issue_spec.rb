require "rails_helper"

feature "User reopens an issue" do
  scenario "In Issue-show view" do
    user = create(:user)
    project = create(:project, name: "Name1", users: [user])
    completed_issue = create(:completed_issue, user: user, project: project, title: "IssueOne")

    visit project_issue_path(project, completed_issue, as: user)
    click_on I18n.t("issues.show.reopen")

    expect(page).not_to have_link(I18n.t("issues.show.reopen"))
    expect(page).to have_link(I18n.t("issues.show.donebtn"))

    visit project_issues_path(project, as: user)
    expect(page).to have_content("IssueOne")

    click_on I18n.t("issues.index.completed")
    expect(page).not_to have_content("IssueOne")
  end
end
