class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.integer :customer_id
      t.string :name
      t.string :postal_code
      t.string :address
      t.datetime :remember_created_at
      t.datetime :remember_updated_at

      t.timestamps
    end
  end
end
