class Service < ActiveRecord::Base
  attr_accessible :title, :type_of_service, :printer_model, :address, :phone, :website, :user, :jobs, :service_id, :latitude, :longitude

  belongs_to :user

  has_many :jobs

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
