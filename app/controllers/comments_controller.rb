class CommentsController < ApplicationController
  # before_action :find_discussion
  
  def index
  end

  def show
    # @comment = Comment.find params[:id]
    # @discussion = Discussion.find params[:discussion_id] 
  end

  def new
    # @comment = Comment.new
  end

  def create
    @discussion = Discussion.find params[:discussion_id] 
    @comment = Comment.new comment_params
    @comment.discussion = @discussion

    if @comment.save
      flash[:notice] = "Your Comment has been created!"
      redirect_to @comment.discussion
    else
      flash[:notice] = "Please correct your errors below!"
      redirect_to @comment.discussion
    end
  end

  def destroy
    @discussion = Discussion.find params[:discussion_id] 
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to @comment.discussion, notice: "Task deleted!"
  end

  def edit
    @discussion = Discussion.find params[:discussion_id] 
    @comment = Comment.find params[:id]
  end

  def update
    @discussion = Discussion.find params[:discussion_id]
    @comment = Comment.find params[:id]
    if @comment.update comment_params
      redirect_to @comment.discussion, notice: "Updated comment successfully!"
    else
      flash.now[:alert] = "Please correct errors below!"
      render :edit
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:body) 
  end

  # def find_discussion
  #   @discussion = Discussion.find params[:discussion_id] 
  # end

end
