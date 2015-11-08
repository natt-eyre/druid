class CreateIssuesTags < ActiveRecord::Migration
  def change
    create_table :issues_tags, id: false do |t|
      t.belongs_to :issue, index: true
      t.belongs_to :tag, index: true
    end
  end
end
