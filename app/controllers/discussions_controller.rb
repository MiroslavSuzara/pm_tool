class DiscussionsController < ApplicationController
  before_action :find_project

  def show
    @project = Project.find(params[:id])
  end
  
  def new
    @discussion = Discussion.new
  end

  def create
    @discussion = Discussion.new discussion_params
    @discussion.project = @project

    if @discussion.save
      redirect_to @project, notice: "Discussion created successfully!"
    else
      render "projects/show"
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