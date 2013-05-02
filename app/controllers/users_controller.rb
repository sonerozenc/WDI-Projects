class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.new

    respond_to do |format|
      format.html
      format.json { render :json => @users }
    end

  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])

      if @user.update_attributes(params[:user])
         redirect_to :action => 'show', :id => @user
      else
         render :action => 'edit'
      end
   end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    
    redirect_to users_url
  end
end

