# require "rails_helper"

# feature "User creates a project" do
#   scenario "first project" do
#     visit root_path(as: create(:user))

#     expect(page).not_to have_link(I18n.t("issues.index.new"))
#     expect(page).not_to have_link(I18n.t("issues.index.issues"))

#     expect(page).to have_content("Let's start with your first project:")

#     fill_in Project.human_attribute_name("name"), with: "Nametest"
#     click_on I18n.t("projects.new.OK")

#     expect(page).to have_link(I18n.t("issues.index.new"))
#     expect(page).to have_link(I18n.t("issues.index.issues"))
#     expect(page.current_path).to eq(project_issues_path(Project.last))
#     expect(page).to have_content("Nametest")
#   end

#   scenario "another project" do
#     user = create(:user)
#     project = create(:project, name: "IssueOne", users: [user])

#     visit root_path(as: user)
#     expect(page).to have_link(I18n.t("issues.index.new"))
#     expect(page).to have_link(I18n.t("issues.index.issues"))

#     click_on I18n.t("projects.index.new")

#     fill_in Project.human_attribute_name("name"), with: "Nametest"
#     click_on I18n.t("projects.new.OK")

#     expect(page.current_path).to eq(project_issues_path(Project.last))
#     expect(page).to have_content("Nametest")
#   end
# end
