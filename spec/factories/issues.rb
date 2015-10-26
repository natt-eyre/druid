FactoryGirl.define do
  factory :issue do
    title "MyString"
    description "MyString"

    factory :completed_issue do
      status 1
    end
  end
end
