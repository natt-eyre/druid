require "rails_helper"

feature "User marks issue as done" do
  scenario "In Issue-show view" do
    user = create(:user)
    completed_issue = create(:completed_issue, user: user, title: "IssueOne")

    visit issue_path(completed_issue, as: user)
    click_on I18n.t("issues.show.reopen")

    expect(page).not_to have_link(I18n.t("issues.show.reopen"))
    expect(page).to have_link(I18n.t("issues.show.donebtn"))

    visit root_path as: user
    expect(page).to have_content("IssueOne")

    click_on I18n.t("issues.index.completed")
    expect(page).not_to have_content("IssueOne")
  end
end
