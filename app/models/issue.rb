class Issue < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  validates :title, presence: true

  def completed?
    self.status == 1
  end

  def open?
    self.status == 0
  end

  def complete!
    self.status = 1
    save!
  end

  def open!
    self.status = 0
    save!
  end

  scope :completed, -> { where(status: 1) }
  scope :open, -> { where(status: 0) }
end
