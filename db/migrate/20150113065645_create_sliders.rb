class CreateSliders < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
      t.string :title
      t.string :image
      t.boolean :is_delete

      t.timestamps null: false
    end
  end
end
