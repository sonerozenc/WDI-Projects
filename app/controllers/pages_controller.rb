class PagesController < ApplicationController
  def index
  	@jobs = Job.all
  	@services = Service.all
  	@users = User.all
  	@user = User.new
    @job = Job.new
    @service = Service.new
  end

  def designers
  end

  def services
  end

  def designs
  end

	def login
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to root_url, :notice => "Logged in"
		else
			redirect_to root_url, :notice => "Failed to log in"
		end
	end

  def logout
		session[:user_id] = nil
		redirect_to root_url, :notice => "Logged out"
  end
end
