module OrdersHelper
  def price(deal)
    raw "<p>fuer #{deal.price_reduced} e</p><p class=\"red\">statt <span class=\"gestrichen\">#{deal.price_original} e</span></p>"
  end

  def item_price(item)
   raw "&euro; #{item.price}"
  end
  
  def item_quantity_input(item)
    text_field(item.quantity)
  end
  
  def price_f(price)
    raw "&euro; #{'%.2f' % price}"
  end

  def price(price)
    raw "&euro; #{price}"
  end
  
  def cent_to_euro(price)
    '%.2f' % (price/100)
  end
  
  def price_deal(item)
    price "<span class='price_deal'>#{cent_to_euro(item.deal.price)}</span>"
  end

  def price_line(item)
    price "<span class='price_line'>#{cent_to_euro(item.price)}</span>"
  end

  def price_total(order)
    price "<span class='order_total'>#{cent_to_euro(order.vat)}</span>"
  end

  def price_vat(order)
    price "<span class='order_vat'>#{cent_to_euro(order.total)}</span>"
  end
  
  
 
  def payment_method(value, label, checked=false)
    raw("<li>
      <label>
        #{radio_button_tag(:method, value, checked)}
        <span>#{label}</span>
      </label>
    </li>")
  end  
end
