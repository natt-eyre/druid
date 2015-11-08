require "rails_helper"

feature "User creates a project" do
  scenario "successfully" do
    visit root_path(as: create(:user))
    click_on I18n.t("projects.index.new")

    fill_in Project.human_attribute_name("name"), with: "Nametest"
    click_on I18n.t("projects.new.OK")

    expect(page).to have_link(I18n.t("issues.index.new"))
    expect(page.current_path).to eq(project_issues_path(Project.last))
    expect(page).to have_content("Nametest")
  end
end
