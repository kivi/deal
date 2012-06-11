class PaymentsController < ApplicationController
  before_filter :require_line_items, :only => [:checkout]
  
  include ActiveMerchant::Billing::Integrations

  def new
    # @payment = Payment.new
  end

  def checkout
    order = current_order
    
    # custom validations, send back to orders if no items or terms not accepted
    if !params[:acceptagb]
      flash[:notice] = 'Bitte die Akzeptzieren Sie unsere AGBs.'
      redirect_to orders_path
      return
    end
    
    # extra_params = URI.encode_www_form(paypal_encrypted)
    #=> "q=ruby&q=perl&lang=en"
    # we create an oder and a payment
    # @order = Order.new()

    # respond_to do |format|
    line_items = []
 
    order.line_items.each do |item|
      line_items<< { :name => item.deal.title,
                   :quantity => item.quantity,
                   :amount => item.deal.price}
    end
    payment = Payment.create!(:state =>:checkout,
                              :price => order.total,
                              :message => params[:message],
                              # :token => setup_response.params['token'],
                              # :response_params => setup_response.params
                              )
    
    
    setup_response = EXPRESS_GATEWAY.setup_purchase(
        order.total, 
        :subtotal => order.price,
        :shipping => order.shipping_cost,
        :handling => 0,
        :tax => order.vat,
        :ip => request.remote_ip,
        :items => line_items,
        :notify_url => "http://vlocal.kivia.de/payments/notify",
        :return_url => "http://vlocal.kivia.de/payments/#{payment.id}/confirm", # payments_confirm_url(payment),
        # :return_url => payments_confirm_url,
        :cancel_return_url => payments_url
      )
    if setup_response

      url = EXPRESS_GATEWAY.redirect_url_for(setup_response.token) # + '&' + paypal_encrypted
      puts "-->URL:" + url
      puts "-->IP:" + request.remote_ip
      puts "-->order.total:" + order.total.to_s
      puts "-->:shipping:" + order.shipping_cost.to_s
      puts "-->:tax:" +  order.vat.to_s
      puts "-->line_items:" + line_items.inspect
      puts "-->setup_response:" + setup_response.params.inspect
      puts "-->CART: purchased at " + Time.now.to_s
      puts "-->return_url:" + "http://vlocal.kivia.de/payments/#{payment.id}/confirm"

      payment.token = setup_response.params['token'];
      payment.save!
      
      # payments.create!(:action => "purchase", :amount => price_in_cents, :response => response)
      # cart.update_attribute(:purchased_at, Time.now) if response.success?
      
                               
      flash[:notice] = 'Payment was successfully created.'

      respond_to do |format|
        format.html { 
          redirect_to "#{url}&useraction=commit"
          # redirect_to "#{url}"
        }
      end
    else
      respond_to do |format|
        format.html { 
          render :action => "new" 
        }
      end
    end
  end    

  def confirm
    
    puts "confirm: #{params}"
    @payment = Payment.find(params[:id])
    redirect_to(root_url) and return unless params[:token]     
    details_response = EXPRESS_GATEWAY.details_for(params[:token])
     
    if !details_response.success?
      @message = details_response.message
      render :action => 'error'
      return
    end
         
    @payment.map_paypal_response(details_response)
    @payment.state = :pending
    @payment.save!
    # @payment.confirm!

    clear_current_order
     
    respond_to do |format|
      format.html { 
        render :action => "confirm"
      }
    end
  end

  def purchase
    payment = Payment.find(params[:id])
    purchase = EXPRESS_GATEWAY.purchase(payment.price,
      :ip       => request.remote_ip,
      :payer_id => params[:payer_id],
      :token    => params[:token]
    )
		
    if !purchase.success?
      @message = purchase.message
      puts "#-----#{purchase.inspect}"
      render :action => 'error'
      return
    end
    redirect_to ("/payments/#{payment.id}/complete")
  end

  def method_name
    
  end

  def notify
    puts "#NOOO#{params}"
    
    notify = Paypal::Notification.new(request.raw_post)
    enrollment = Enrollment.find(notify.item_id)

    if notify.acknowledge
      @payment = Payment.find_by_confirmation(notify.transaction_id) ||
        enrollment.invoice.payments.create(:amount => notify.amount,
          :payment_method => 'paypal', :confirmation => notify.transaction_id,
          :description => notify.params['item_name'], :status => notify.status,
          :test => notify.test?)
      begin
        if notify.complete?
          @payment.status = notify.status
        else
          logger.error("Failed to verify Paypal's notification, please investigate")
        end
      rescue => e
        @payment.status = 'Error'
        raise
      ensure
        @payment.save
      end
    end
    render :nothing => true
  end
  
  # def notify
  #   puts "# Create a notify object we must"
  #   notify = Paypal::Notification.new(request.raw_post)
  # 
  #   puts "#we must make sure this transaction id is not allready completed"
  #   if !Payment.count("*", :conditions => ["paypal_transaction_id = ?", notify.transaction_id]).zero?
  #      puts "# do some logging here..."
  #   end
  #   
  #   payment = Payment.find()
  #   
  #   if notify.acknowledge
  #     begin
  #       if notify.complete?
  #         payment.ipn_data = params
  #         payment.complete!
  #         payment.save
  #         puts "#transaction complete.. add your business logic here"
  #       else
  #          puts "#Reason to be suspicious"
  #       end
  #     rescue => e
  #       puts "#Houston we have a bug"
  #     ensure
  #       puts "#make sure we logged everything we must"
  #     end
  #   else #transaction was not acknowledged
  #     puts "# another reason to be suspicious"
  #   end
  # 
  #   render :nothing => true
  # end
end
