class Tag < ActiveRecord::Base
  belongs_to :project
  has_and_belongs_to_many :issues
  validates :name, presence: true
end
