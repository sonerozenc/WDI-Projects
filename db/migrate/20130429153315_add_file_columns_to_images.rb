class AddFileColumnsToImages < ActiveRecord::Migration
  def self.up
    add_attachment :images, :file
  end

  def self.down
    add_attachment :images, :file
  end
end