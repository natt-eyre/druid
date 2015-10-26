require 'rails_helper'

RSpec.describe Issue, :type => :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:title) }

  describe "#completed?" do
    it "returns true if completed" do
      user = create(:user)
      issue = create(:issue, user: user)
      issue.complete!

      expect(issue.completed?).to be_truthy
    end

    it "returns false if not" do
      user = create(:user)
      issue = create(:issue, user: user)

      expect(issue.completed?).to be_falsey
    end
  end
end
