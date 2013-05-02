class CreateSketchfabs < ActiveRecord::Migration
  def change
    create_table :sketchfabs do |t|
      t.string :provider_url
      t.string :provider_name
      t.string :thumbnail_url
      t.string :thumbnail_width
      t.string :thumbnail_height
      t.string :author_name
      t.string :author_url
      t.string :title
      t.string :html
      t.integer :width
      t.integer :height
      t.string :version
      t.string :type
      t.references :job

      t.timestamps
    end
  end
end
