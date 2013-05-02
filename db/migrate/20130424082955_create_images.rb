class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :caption
      t.string :file
      t.references :user
      t.references :job

      t.timestamps
    end
    add_index :images, :user_id
    add_index :images, :job_id

    # add_index :images, :file, :unique => true
  
  end
end
