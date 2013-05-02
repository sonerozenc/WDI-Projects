class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @job = Job.find(params[:job_id])
    @comment = Comment.new(params[:comment])
    @comment.job = @job
    @comment.user = current_user

    if @comment.save
      redirect_to job_path(@job)
    else
      puts @comment
      render action: "new"
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
      @comment = Comment.find(params[:id])

      if @comment.update_attributes(params[:comment])
         redirect_to :action => 'show', :id => @comment
      else
         render :action => 'edit'
      end
   end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    
    redirect_to comments_url
  end
end
