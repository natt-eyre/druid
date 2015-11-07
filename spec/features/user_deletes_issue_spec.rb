require "rails_helper"

feature "User deletes an issue" do
  scenario "successfully", js: true do
    user = create(:user)
    project = create(:project, name: "Name1", users: [user])
    issue = create(:issue, user: user, project: project, title: "IssueOne")

    visit project_issue_path(project, issue, as: user)
    accept_confirm do
      click_on I18n.t("issues.show.delete")
    end

    expect(page.current_path).to eq(project_issues_path(project))
    expect(page).not_to have_content("IssueOne")
  end
end
