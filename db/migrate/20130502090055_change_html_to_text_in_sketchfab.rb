class ChangeHtmlToTextInSketchfab < ActiveRecord::Migration
  def change
  	change_column(:sketchfabs, :html, :text)
  end
end
