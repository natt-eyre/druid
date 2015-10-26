class AddStatusToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :status, :integer, default: 0
  end
end
