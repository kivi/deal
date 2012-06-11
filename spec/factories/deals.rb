# Read about factories at http://github.com/thoughtbot/factory_girl


FactoryGirl.define do

  sequence :title do |n|
    "DEAL #{n}"
  end


  factory :deal do
    is_active false
    is_running false
    product_type "MyString"
    # sequence(:title)
    title { Factory.next(:title) }
    descritpion "my super DEAL number"
    price_original 10
    price_reduced 5
    discount 0.5
    starts_at "2012-01-19 14:17:29"
    ends_at "2012-01-19 14:17:29"
    min 1
    max 1
    count 1
  end
end
