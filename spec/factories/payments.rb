# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :payment do
    references ""
    state "MyString"
    token "MyString"
    price 1
    email "MyString"
    first_name "MyString"
    last_name "MyString"
    middle_name "MyString"
    company "MyString"
    address1 "MyString"
    address2 "MyString"
    city "MyString"
    state "MyString"
    country "MyString"
    confirmed_at "2012-01-20 18:17:28"
    completed_at "2012-01-20 18:17:28"
  end
end
