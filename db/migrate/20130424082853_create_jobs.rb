class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :cad_file
      t.string :material
      t.boolean :is_private
      t.string :order_status
      t.references :service
      t.references :user
      t.references :sketchfab

      t.timestamps
    end
    add_index :jobs, :service_id
    add_index :jobs, :user_id
  end
end
