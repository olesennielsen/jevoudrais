# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gift_template do
    name "MyString"
    image_link "MyString"
    product_link "MyString"
    user nil
  end
end
