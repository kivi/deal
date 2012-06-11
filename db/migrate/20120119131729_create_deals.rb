class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.boolean :is_active
      t.boolean :is_running
      t.string :product_type
      t.string :title
      t.text :descritpion
      t.string :image
      t.integer :price_original
      t.integer :price_reduced
      t.integer :discount
      t.datetime :starts_at
      t.datetime :ends_at
      t.integer :min
      t.integer :max
      t.integer :count

      t.timestamps
    end
  end
end
