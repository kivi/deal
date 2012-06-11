class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :order
      t.string :paypal_transaction_id
      t.string :token
      t.integer :price
      t.string :email
      t.string :firstname
      t.string :lastname
      t.string :middelname
      t.string :company
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :country
      
      t.text   :message
      
      t.datetime :confirmed_at
      t.datetime :completed_at

      t.string :response_params
      t.text :ipn_data

      t.timestamps
    end
  end
end
