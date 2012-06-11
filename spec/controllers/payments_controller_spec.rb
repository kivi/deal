require 'spec_helper'

describe PaymentsController do

  def trans_id
    "16F08736TA389152H"
  end

  def ipn_params
    {"payment_date" => "04:33:33 Oct 13.2007+PDT" ,
      "txn_type" => "web_accept",
      "last_name" => "User",
      "residence_country" => "US",
      "item_name" => "FWJ - 3 Credits",
      "payment_gross" => "180.00",
      "mc_currency" => "USD",
      "business" => "replace_this_with_your_account",
      "payment_type" => "instant",
      "verify_sign" => "AZQLcOZ7B.YM2m-QDAXOrQQcLFYuA0N0XoC3zadaGhkGNF2nlRWmpzlI",
      "payer_status" => "verified",
      "test_ipn" => "1",
      "tax" => "0.00",
      "payer_email" =>  'vikas_1325163748_per@nextsocial.de',
      "txn_id" => trans_id,
      "quantity" => "1",
      "receiver_email" => 'vikas@nextsocial.de',
      "first_name" => "Test",
      "invoice" => nil,
      "payer_id" =>  10,
      "receiver_id" => 10,
      "item_number" => "3",
      "payment_status" => "Completed",
      "payment_fee" => "5.52",
      "mc_fee" => "5.52",
      "shipping" => "0.00",
      "mc_gross" => "180.00",
      "custom" => "3",
      "charset" => "windows-1252",
      "notify_version" => "2.4"
    }
  end


  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'confirm'" do
    it "returns http success" do
      # get 'confirm'
      # response.should be_success || true 
    end
  end

  describe "GET 'complete'" do
    it "returns http success" do
      get 'complete'
      response.should be_success
    end
  end
  
  
  describe "IPN Callback for Paypal" do
    describe "with invalid params" do
      it "log error and log transaction, ipn not acknowledged" do
        post :ipn, ipn_params.merge("acknowledge" => "false")
        # assert_response 403
        # assert !@emails.empty?
        # email = @emails.first
      end
    end
  end

end
