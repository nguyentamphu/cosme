class CreateProductImages < ActiveRecord::Migration
  def change
    create_table :product_images do |t|
      t.string :image
      t.boolean :is_delete
      t.references :product, index: true

      t.timestamps null: false
    end
  end
end
