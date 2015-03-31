class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :serial
      t.integer :height
      t.text :detail
      t.integer :price
      t.integer :sale_off
      t.integer :quantity
      t.integer :discount
      t.boolean :is_delete
      t.references :category, index: true
      t.references :brand, index: true
      t.timestamps null: false
    end
  end
end
