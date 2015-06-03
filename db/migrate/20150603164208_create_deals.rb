class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :title
      t.string :image
      t.string :link
      t.boolean :is_delete

      t.timestamps null: false
    end
  end
end
