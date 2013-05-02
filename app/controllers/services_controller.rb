class ServicesController < ApplicationController
  def index
    @services = Service.all
    @user = User.new

    respond_to do |format|
      format.html
      format.json { render :json => @services, :include => [:user] }
    end

  end

  def show
    @service = Service.find(params[:id])
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(params[:service])
    @service.user = current_user

    if @service.save
      redirect_to @service
    else
      render action: "new"
    end
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
      @service = Service.find(params[:id])

      if @service.update_attributes(params[:service])
         redirect_to :action => 'show', :id => @service
      else
         render :action => 'edit'
      end
   end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    
    redirect_to services_url
  end
end
