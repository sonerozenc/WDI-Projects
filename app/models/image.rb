class Image < ActiveRecord::Base
  attr_accessible :caption, :file, :user, :job

  belongs_to :user
  belongs_to :job

  has_attached_file :file, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

end