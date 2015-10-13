require "rails_helper"

feature "User views the requested issue" do
  scenario "of this user" do
    user = create(:user)
    issue = create(:issue, user: user, title: "IssueOne")

    visit issue_path(issue, as: user)
    click_on I18n.t("issues.show.edit")

    fill_in Issue.human_attribute_name("title"), with: "IssueUpdate"
    click_on I18n.t("issues.new.save")

    expect(page).to have_content("IssueUpdate")
  end
end
