require "rails_helper"

feature "User creates an issue" do
  scenario "successfully" do
    user = create(:user)
    project = create(:project, name: "Name1", users: [user])

    visit project_issues_path(project, as: user)
    click_on I18n.t("issues.index.new")

    select('Name1', :from => 'Project')
    fill_in Issue.human_attribute_name("title"), with: "titletest"
    fill_in Issue.human_attribute_name("description"), with: "desctest"
    click_on I18n.t("issues.new.save")

    expect(page.current_path).to eq(project_issue_path(project, Issue.last))
    expect(page).to have_content("titletest")
  end
end
