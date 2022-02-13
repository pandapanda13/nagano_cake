class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :item_id
      t.integer :order_id
      t.integer :price
      t.integer :amount
      t.integer :production_progress, default: 0
      t.datetime :remember_created_at
      t.datetime :remember_updated_at

      t.timestamps
    end
  end
end
