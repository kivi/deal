# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Dealapp::Application.initialize!

Dealapp::Application.configure do
  # config.action_controller.allow_forgery_protection = false
  config.gem "koala"
  
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.smtp_settings = {  
    :address              => "smtp.gmail.com",
    :port                 => 587,  
    :user_name            => "xmen@chatmasala.de",  
    :password             => "xmen2011",  
    :authentication       => "plain",  
    :enable_starttls_auto => true  
  }
 end

# Our Currency
ActiveMerchant::Billing::PaypalExpressGateway.default_currency = 'EUR'
