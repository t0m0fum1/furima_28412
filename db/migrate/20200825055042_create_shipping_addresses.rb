class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.references :buy,            null: false,foreign_key: true
      t.integer :prefecture,        null: false
      t.string :postal_code,        null: false
      t.string :city,               null: false
      t.string :address,            null: false 
      t.string :building_name 
      t.string :tel,                null: false 
      t.timestamps
    end
  end
end
