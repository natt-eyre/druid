class Project < ActiveRecord::Base
  has_many :issues
  has_and_belongs_to_many :users
  validates :name, presence: true
end
