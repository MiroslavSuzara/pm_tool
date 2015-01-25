class ProjectsController < ApplicationController
 
  def index
  @projects = Project.all
  end

  def show
  @project = Project.find params[:id]
  end

  def new
  @project = Project.new
  end

  def create
    @project = Project.new project_params
    if @project.save
      flash[:notice] = "Your Project has been created!"
      redirect_to projects_path
    else
      render :new
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :due_date)
  end

end
