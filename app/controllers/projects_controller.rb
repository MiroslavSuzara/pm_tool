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
      flash[:notice] = "Please correct your errors below!"
      render :new
    end
  end

  def edit
  @project = Project.find(params[:id])
  end

  def update
    @project = Project.find params[:id]
    if @project.update project_params
      flash[:notice] = "Project updated!"
      redirect_to @project
    else
      flash[:notice] = "Please correct your errors below!"
      render :edit
    end
  end

  def destroy
    @project = Project.find params[:id]
    @project.destroy
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :due_date)
  end

end
