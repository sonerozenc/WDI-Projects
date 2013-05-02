class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :subject
      t.string :message
      t.references :user
      t.references :job

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :job_id
  end
end
