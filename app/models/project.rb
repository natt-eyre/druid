class Project < ActiveRecord::Base
  has_many :issues
  has_many :tags
  has_and_belongs_to_many :users
  validates :name, presence: true

  after_create :add_default_tag_set!

  private

  def add_default_tag_set!
    bug = Tag.create!(name: "bug", color: "e11d21", project_id: id)
    feature = Tag.create!(name: "feature", color: "009800", project_id: id)
    tags << bug
    tags << feature
  end
end
