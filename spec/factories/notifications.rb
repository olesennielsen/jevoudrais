# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notification do
    body "MyText"
    user nil
    seen false
  end
end
