require 'rest_client'
require 'ruby-multipart-post'

class JobsController < ApplicationController
  def index
    @jobs = Job.all
    @job = Job.new
    @user = User.new

    respond_to do |format|
      format.html
      format.json { render :json => @jobs, :include => [:user, :sketchfab] }
    end
  end

  def show
    @job = Job.find(params[:id])
    @comment = Comment.new(:job => @job)
    @image = Image.new
  end

  def new
    @service = Service.find(params[:service_id])
    @job = Job.new(:service => @service)
  end

  def create
    @service = Service.find(params[:job][:service_id])
    params[:job][:service] = @service
    @job = Job.new(params[:job])

    @job.user = current_user
    
    if @job.save


      temporary_file = params[:job][:cad_file].path

      response = RestClient.post("https://api.sketchfab.com/v1/models", {
        token: "8765434590494ef890281bfb7c718b18",
        # fileModel: FileUploadIO.new('/Users/sonerozenc/Downloads/Up_Spool_Clip_v3-0.STL', "application/octet-stream"),
        # fileModel: FileUploadIO.new("/Users/sonerozenc/Desktop/wdi_hw/week_3/makersmap112/public" + @job.cad_file.url(:original, timestamp: false) , "application/octet-stream"),
        fileModel: FileUploadIO.new(temporary_file, "application/octet-stream"),
        title: "Clip file",
        description: "This is my new clip file that I downloaded from Sketchfab",
        tags: "clip",
        private: (
          if @job.is_private
            1
          else
            0
          end
        ),
        password: "12345678",
      })

      # render :text => JSON.parse(response)['result']['id']

      selected_id = JSON.parse(response)['result']['id']

      response2 = RestClient.get 'https://sketchfab.com/oembed?url=https://sketchfab.com/show/' + selected_id + '&maxheight=160&maxwidth=320'

      # render :text => JSON.parse(response2)['html']


      @sketchfab = Sketchfab.new
      @sketchfab.provider_url = JSON.parse(response2)['provider_url']
      @sketchfab.provider_name = JSON.parse(response2)['provider_name']
      @sketchfab.thumbnail_url = JSON.parse(response2)['thumbnail_url']
      @sketchfab.thumbnail_width = JSON.parse(response2)['thumbnail_width']
      @sketchfab.thumbnail_height = JSON.parse(response2)['thumbnail_height']
      @sketchfab.author_name = JSON.parse(response2)['author_name']
      @sketchfab.author_url = JSON.parse(response2)['author_url']
      @sketchfab.title = JSON.parse(response2)['title']
      @sketchfab.html = JSON.parse(response2)['html']
      @sketchfab.width = JSON.parse(response2)['width']
      @sketchfab.height = JSON.parse(response2)['height']
      @sketchfab.version = JSON.parse(response2)['version']
      @sketchfab.sketchfab_type = JSON.parse(response2)['type']
      @sketchfab.job = @job
      @sketchfab.save

      @job.sketchfab_id = @sketchfab.id
      @job.save

      # redirect_to @job
      # redirect_to root_path
    else
      render action: "new"
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
      @job = Job.find(params[:id])

      if @job.update_attributes(params[:job])
         redirect_to :action => 'show', :id => @job
      else
         render :action => 'edit'
      end
   end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    
    redirect_to jobs_url
  end
end
