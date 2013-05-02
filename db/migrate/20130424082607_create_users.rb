class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :password_confirmation
      t.string :address
      t.string :phone
      t.string :website
      t.float :latitude
      t.float :longitude
      t.boolean :is_designer

      t.timestamps
    end

    add_index :users, :email, :unique => true
    add_index :users, :name
    add_index :users, :is_designer
  end
end
