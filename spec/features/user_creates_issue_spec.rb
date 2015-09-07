require "rails_helper"

feature "User creates an issue" do
  scenario "successfully" do
    visit root_path(as: create(:user))
    click_on I18n.t("issues.index.new")

    fill_in Issue.human_attribute_name("title"), with: "titletest"
    fill_in Issue.human_attribute_name("description"), with: "desctest"
    click_on I18n.t("issues.new.save")

    expect(page.current_path).to eq(issue_path(Issue.last))
    expect(page).to have_content("titletest")
  end
end
