# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    ip "MyString"
    session_id "MyString"
  end


  factory :order_with_two_items, :parent => :order do
    items { |a| a.association(:deal) }
    
    # items [:line_item_price_10, :line_item_price_30]
  end

end
