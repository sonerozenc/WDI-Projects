class Comment < ActiveRecord::Base
  attr_accessible :message, :subject, :user, :job

  # validates_presence_of :user, :on => :create
  # validates_presence_of :job, :on => :create

  belongs_to :user
  belongs_to :job
end
