require "rails_helper"

feature "User deletes an issue" do
  scenario "successfully", js: true do
    user = create(:user)
    issue = create(:issue, user: user, title: "IssueOne")

    visit issue_path(issue, as: user)
    accept_confirm do
      click_on I18n.t("issues.show.delete")
    end

    expect(page.current_path).to eq(root_path)
    expect(page).not_to have_content("IssueOne")
  end
end
