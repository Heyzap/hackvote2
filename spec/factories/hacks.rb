# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :hack do
    creator "MyString"
    title "MyString"
    hackday_id 1
    votes 1
  end
end
