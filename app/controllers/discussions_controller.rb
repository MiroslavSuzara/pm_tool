class DiscussionsController < ApplicationController

  def show
    @project = Project.find(params[:id])
  end
  
end
