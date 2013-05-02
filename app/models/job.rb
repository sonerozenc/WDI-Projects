class Job < ActiveRecord::Base
  attr_accessible :title, :cad_file, :material, :is_private, :order_status, :service_id, :user, :service, :sketchfab_id

  belongs_to :user
  belongs_to :service

  has_many :images
  has_many :uploaders, :through => :images, :source => :user

  has_many :comments
  has_many :commenters, :through => :comments, :source => :user

  has_one :sketchfab

  has_attached_file :cad_file
end
