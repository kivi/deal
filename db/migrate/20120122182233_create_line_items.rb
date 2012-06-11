class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :order
      t.references :deal
      t.integer :quantity
      t.string :session_id

      t.timestamps
    end
    add_index :line_items, :order_id
    add_index :line_items, :deal_id
  end
end
