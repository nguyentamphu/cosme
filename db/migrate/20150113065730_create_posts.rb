class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :kind
      t.string :detail
      t.string :note
      t.boolean :is_delete

      t.timestamps null: false
    end
  end
end
