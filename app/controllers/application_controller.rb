class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :sess

  def sess
    session[:foo] = "foo"    
  end

  def current_order
    order = Order.find_by_session_id(request.session_options[:id])
    if !order
      order = Order.new()
      order.ip = request.remote_ip
      order.session_id = request.session_options[:id]
      order.save!
    end
    order
  end

  def clear_current_order
    current_order.session_id = nil
    current_order.save
  end  
  
  def require_line_items
    redirect_to deals_path if current_order.line_items.count == 0
  end
  
end
