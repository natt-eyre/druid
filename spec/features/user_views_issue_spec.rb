require "rails_helper"

feature "User views an issue" do
  scenario "successfully" do
    issue = create(:issue, title: "IssueOne")

    visit issue_path(issue)
    expect(page).to have_content("IssueOne")
  end
end
