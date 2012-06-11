class OrdersController < ApplicationController
  before_filter :require_line_items
  require 'orders_helper'
  
  def index
    @order = current_order    
  end
  
  def update
    
  end
  
  
  def quantity
    line_item = current_order.line_items.find(params[:id])
    if line_item
      line_item.quantity += params[:q].to_i
      if line_item.quantity >= 0
        line_item.save
        @return = { :id => line_item.id,
                    :quantity => line_item.quantity, 
                    :price_line => '%.2f' % line_item.price, 
                    :total => '%.2f' % current_order.total_incl_shipping,
                    :vat => '%.2f' % current_order.vat,
                    :shipping_cost => '%.2f' % current_order.shipping_cost
                  }
      end
    end    
    render :json => @return 
  end
  

end
