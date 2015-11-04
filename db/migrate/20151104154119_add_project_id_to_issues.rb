class AddProjectIdToIssues < ActiveRecord::Migration
  def change
    add_reference :issues, :project, index: true, foreign_key: true
  end
end
