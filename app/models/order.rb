class Order < ActiveRecord::Base
	has_many :line_items
  has_many :deals, :through => :line_items
  
  def shipping_cost
    400
  end
  
  def price
    line_items.sum(&(:price))
  end
  
  def total_incl_shipping()
    price + shipping_cost
  end

  def vat()
   total_incl_shipping * 0.19
  end
  
  def total()
    total_incl_shipping + vat
  end
  
  def push(item)
    line_item = line_items.where('deal_id = ?', item.id).first
    if line_item && line_item.deal_id == item.id
      line_item.update_attributes(:quantity => line_item.quantity+1)
    else
      deals<<item
    end
  end

  # TODO better to overide the generated method.
  # def line_items<<(item)
  # end
  
end

