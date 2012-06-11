class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :ip
      t.string :session_id

      t.timestamps
    end
  end
end
