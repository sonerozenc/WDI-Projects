class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :title
      t.string :type_of_service
      t.string :printer_model
      t.string :website
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :phone
      t.references :user

      t.timestamps
    end
    add_index :services, :user_id
    add_index :services, :type_of_service
    add_index :services, :printer_model
    add_index :services, :address
  end
end
