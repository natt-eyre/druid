require "rails_helper"

feature "User creates an issue" do
  scenario "successfully" do
    user = create(:user)
    project = create(:project, users: [user])
    visit root_path(as: user)
    click_on I18n.t("issues.index.new")

    select('Option', :from => 'Select Box')
    fill_in Issue.human_attribute_name("title"), with: "titletest"
    fill_in Issue.human_attribute_name("description"), with: "desctest"
    click_on I18n.t("issues.new.save")

    expect(page.current_path).to eq(issue_path(Issue.last))
    expect(page).to have_content("titletest")
  end
end
