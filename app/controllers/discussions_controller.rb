class DiscussionsController < ApplicationController
  before_action :find_project

  def show
    @discussion = Discussion.find params[:id]
    @comment = Comment.new
  end
  
  def new
    @discussion = Discussion.new
  end

  def create
    @discussion = Discussion.new discussion_params
    @discussion.project = @project

    if @discussion.save
      flash[:notice] = "Your Discussion has been created!"
      redirect_to @project
    else
      flash[:notice] = "Please correct your errors below!"
      redirect_to @discussion.project
    end
  end

  def destroy
    @discussion = Discussion.find params[:id]
    @discussion.destroy
    redirect_to @discussion.project, notice: "Discussion deleted!"
  end

  def edit
    @discussion = Discussion.find params[:id]
  end

  def update
    @discussion = Discussion.find params[:id]
    if @discussion.update discussion_params
      redirect_to @project, notice: "Updated successfully!"
    else
      flash.now[:alert] = "Please correct errors below!"
      render :edit
    end
  end

  private

  def discussion_params
    params.require(:discussion).permit(:title, :description) 
  end

  def find_project
    @project = Project.find params[:project_id] 
  end

end