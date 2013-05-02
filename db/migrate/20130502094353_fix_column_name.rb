class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :sketchfabs, :type, :sketchfab_type
  end
end
