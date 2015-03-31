class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.boolean :is_delete
      t.boolean :is_show
      t.references :product, index: true
      t.references :account, index: true

      t.timestamps null: false
    end
  end
end
