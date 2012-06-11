class Payment < ActiveRecord::Base
  extend StateMachine::MacroMethods
  # include AASM
  # 
  # 
  # aasm :column => :state do
  #   state :pending, :initial => true
  #   state :confirmed, :enter => :do_confirm
  #   state :completed, :enter => :do_complete
  #  
  #   event :confirm do
  #     transitions :to => :confirmed, :from => [:pending]
  #   end
  #  
  #   event :complete do
  #     transitions :to => :completed, :from => [:confirmed]
  #   end
  # end
  
  
  # order state machine (see http://github.com/pluginaweek/state_machine/tree/master for details)
  
  
  attr_accessor :state
  # define_attribute_methods [:state]
  
  # scope :with_state, lambda { |s| where(:state => s) }
  # scope :pending, with_state('pending')
  
    
  state_machine :initial => :checkout do
    # With card payments, happens before purchase or authorization happens
    event :started_processing do
      transition :from => [:checkout, :pending, :completed], :to => :processing
    end
    # When processing during checkout fails
    event :failure do
      transition :from => :processing, :to => :failed
    end
    # With card payments this represents authorizing the payment
    event :pend do
      transition :from => :processing, :to => :pending
    end
    # With card payments this represents completing a purchase or capture transaction
    event :complete do
      transition :from => [:processing, :pending], :to => :completed
    end
    event :void do
      transition :from => [:pending, :completed], :to => :void
    end
  end
  
  #   before_transition :to => 'complete' do |order|
  #     begin
  #       order.process_payments!
  #     rescue Core::GatewayError
  #       !!Spree::Config[:allow_checkout_on_gateway_error]
  #     end
  #   end
  
  #   after_transition :to => 'complete', :do => :finalize!
  #   after_transition :to => 'delivery', :do => :create_tax_charge!
  #   after_transition :to => 'payment',  :do => :create_shipment!
  #   after_transition :to => 'resumed',  :do => :after_resume
  #   after_transition :to => 'canceled', :do => :after_cancel
    
  
  
  def do_complete
    self.completed_at = Time.now
  end
   
  def do_confirm
    self.confirmed_at = Time.now
  end
  
  
  def map_paypal_response(details_response)
    self.attributes = {
      :payer_id => details_response.params['payer_id'],
      :firstname => details_response.params['first_name'], 
      :lastname => details_response.params['last_name'], 
      :middelname => details_response.params['middle_name'], 
      :email => details_response.params['payer'],
      :country => details_response.params['payer_country'],
      :company => details_response.params['payer_business'],
      :address1 => details_response.params['street1'],
      :address2 => details_response.params['street2'],
      :city => details_response.params['city_name'],
      :token => details_response.params['token']
    }
  end
end
