class User < ActiveRecord::Base
  attr_accessible :name, :email, :address, :phone, :website, :is_designer, :password, :password_confirmation, :services, :jobs, :latitude, :longitude

	has_secure_password

	validates_presence_of :password, :on => :create

  has_many :services, :dependent => :destroy
  has_many :jobs, :dependent => :destroy

  has_many :images, :dependent => :destroy
  has_many :imaged_jobs, :through => :images

  has_many :comments, :dependent => :destroy
  has_many :commented_jobs, :through => :comments

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

end
