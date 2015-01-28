class CommentsController < ApplicationController
  before_action :find_discussion
  
  def index
  end

  def show
  end

  def new
    # @comment = Comment.new
  end

  def create
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

  private

  def comment_params
    params.require(:comment).permit(:body) 
  end

  def find_discussion
    @discussion = Discussion.find params[:discussion_id] 
  end

end
