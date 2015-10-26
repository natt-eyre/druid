require "rails_helper"

feature "User marks issue as done" do
  scenario "In Issue-show view" do
    user = create(:user)
    issue = create(:issue, user: user, title: "IssueOne")

    visit issue_path(issue, as: user)
    click_on I18n.t("issues.show.donebtn")

    expect(page).not_to have_link(I18n.t("issues.show.donebtn"))
    expect(page).to have_link(I18n.t("issues.show.reopen"))

    visit root_path as: user
    expect(page).not_to have_content("IssueOne")

    click_on I18n.t("issues.index.completed")
    expect(page).to have_content("IssueOne")
  end
end
