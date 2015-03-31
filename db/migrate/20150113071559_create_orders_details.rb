class CreateOrdersDetails < ActiveRecord::Migration
  def change
    create_table :orders_details do |t|
      t.integer :price
      t.integer :quantity
      t.boolean :is_delete
      t.references :order, index: true
      t.references :product, index: true
      
      t.timestamps null: false
    end
  end
end
