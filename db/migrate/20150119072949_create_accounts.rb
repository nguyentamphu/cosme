class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :email
      t.string :password
      t.string :role
      t.string :full_name
      t.string :tel
      t.date :birthday
      t.string :address
      t.boolean :gender
      t.string :image
      t.boolean :is_delete

      t.timestamps null: false
    end 
  end
end
