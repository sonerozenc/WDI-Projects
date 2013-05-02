class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new({job: params[:job_id]})
  end

  def create
    @image = Image.new(params[:image])
    @image.user = current_user

    @job = Job.find(params[:image][:job])
    @image.job = @job

    if @image.save
      # redirect_to @image
      redirect_to job_path(@job)
    else
      render action: "new"
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
      @image = Image.find(params[:id])

      if @image.update_attributes(params[:image])
         redirect_to :action => 'show', :id => @image
      else
         render :action => 'edit'
      end
   end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    
    redirect_to images_url
  end
end
