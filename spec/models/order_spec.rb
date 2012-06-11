require 'spec_helper'

describe Order do
  specify "should give total amount of prices in order" do
    # order = Factory.create(:order_with_two_items)
    # order.price 
    # 
    # puts '----'
    # puts order.items.inspect
    #     puts '----'
    # 
    # order.price.should eq(30)
  end
  
  specify "should give total amount of prices in order" do
    order = Factory.create(:order)
    deal_1 = Factory.create(:deal)
    deal_2 = Factory.create(:deal)

    order.deals.count.should eq(0)
    order.push(deal_1)
    order.deals.count.should eq(1)
    order.push(deal_2)
    order.deals.count.should eq(2)
    order.push(deal_2) 
    order.deals.count.should eq(2)
    
    order.line_items.first.quantity.should eq (1)
    order.line_items.second.quantity.should eq (2)
  end
end
