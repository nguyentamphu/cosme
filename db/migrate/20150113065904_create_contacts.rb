class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :mail
      t.string :phone
      t.string :content_send
      t.boolean :status
      t.string :reply_title
      t.string :content_reply
      t.boolean :is_delete

      t.timestamps null: false
    end
  end
end
