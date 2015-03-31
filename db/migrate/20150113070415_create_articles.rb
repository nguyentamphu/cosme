class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.string :detail
      t.string :image
      t.boolean :is_delete

      t.timestamps null: false
    end
  end
end
