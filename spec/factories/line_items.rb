# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :line_item do
    order :order
    deal :deal
    quantity nil
    session_id "MyString"
  end
  
  
  # factory :line_item_price_10, :parent => :line_item do
  #   deal :deal.price = 10
  # end
  # 
  # factory :line_item_price_10, :parent => :line_item do
  #   deal :deal.price = 20
  # end
  
end
