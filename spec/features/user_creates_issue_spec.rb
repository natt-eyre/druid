require "rails_helper"

feature "User creates an issue" do
  scenario "successfully" do
    visit root_path(as: create(:user))
    click_button "New"

    fill_in "Title", with: "titletest"
    fill_in "Description", with: "desctest"
    click_on "Save"

    expect(page.current_path).to eq(issue_path(Issue.last))
    expect(page).to have_content("titletest")
  end
end
