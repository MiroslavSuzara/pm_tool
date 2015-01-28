class ProjectsController < ApplicationController
  before_action :find_project


  def index
    @projects = Project.all
  end

  def show
    @task = Task.new
    @discussion = Discussion.new
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new project_params
    if @project.save
      flash[:notice] = "Your Project has been created!"
      redirect_to @project
    else
      flash[:notice] = "Please correct your errors below!"
      render :new
    end
  end

  def edit
  end

  def update
    if @project.update project_params
      flash[:notice] = "Project updated!"
      redirect_to @project
    else
      flash[:notice] = "Please correct your errors below!"
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :due_date)
  end

  def find_project
    @project = Project.find params[:id] 
  end

end
