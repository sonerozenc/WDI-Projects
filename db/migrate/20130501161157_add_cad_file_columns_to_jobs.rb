class AddCadFileColumnsToJobs < ActiveRecord::Migration
  def self.up
    add_attachment :jobs, :cad_file
  end

  def self.down
    remove_attachment :jobs, :cad_file
  end
end