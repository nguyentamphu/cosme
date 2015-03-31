class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.boolean :active_status
      t.boolean :pay_status
      t.boolean :ship_status
      t.string :pay_type
      t.integer :amount
      t.datetime :ship_at
      t.boolean :is_delete
      t.references :account, index: true
      t.timestamps null: false
    end
  end
end
