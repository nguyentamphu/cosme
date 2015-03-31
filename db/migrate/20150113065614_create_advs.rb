class CreateAdvs < ActiveRecord::Migration
  def change
    create_table :advs do |t|
      t.string :title
      t.string :image
      t.string :link
      t.boolean :is_delete

      t.timestamps null: false
    end
  end
end
