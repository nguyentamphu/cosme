class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :rating
      t.boolean :is_delete

      t.references :product, index: true
      t.references :account, index: true

      t.timestamps null: false
    end
  end
end
