require 'spec_helper'

describe OrdersController do
  def valid_attributes
    {}
  end  
  def valid_session
    {}
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      assigns(:order).should be_a_kind_of(Order)
    end
  end
  
  describe "GET 'quantity'" do
    it "changes quantity of line_item" do
      # order = Factory.create(:order)
      # order.session_id = session[:id]      
      # order.push(Factory.create(:deal))
      # item = order.line_items.find(:first)

      # expect {
        # get :quantity, {:id => item.id, :q => 1}
      # }.to change(item.quantity).by(1)
      # assigns(:status).should eq(true)
    end
  end
  
  
  
end
