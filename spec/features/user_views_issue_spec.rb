require "rails_helper"

feature "User views the requested issue" do
  scenario "of this user" do
    user = create(:user)
    issue = create(:issue, user: user, title: "IssueOne")

    visit issue_path(issue, as: user)
    expect(page).to have_content("IssueOne")
  end

  scenario "of other user - unsuccessfully" do
    our_user = create(:user)
    other_user = create(:user)
    issue = create(:issue, user: other_user)

    visit issue_path(issue, as: our_user)
    expect(page.current_path).to eq(issues_path)
  end
end
