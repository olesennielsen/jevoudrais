# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gift do
    name "MyString"
    receiver nil
    giver nil
  end
end
