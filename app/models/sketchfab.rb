class Sketchfab < ActiveRecord::Base
  attr_accessible :author_name, :author_url, :height, :html, :provider_name, :provider_url, :thumbnail_height, :thumbnail_url, :thumbnail_width, :title, :type, :version, :width

  belongs_to :job
end
