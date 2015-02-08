class ProjectsController < ApplicationController
  before_action :find_project, 
                  only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :restrict_access, only: [:destroy]

  def index
    @projects = Project.all.order("due_date ASC")
  end

  def show
    @project = Project.find(params[:project_id] || params[:id])
    # @project = Project.find params[:id]
    @task = Task.new
    @tasks = @project.tasks
    @discussion = Discussion.new
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new project_params
    @project.user = current_user     
    if @project.save
      flash[:notice] = "Your Project has been created!"
      redirect_to @project
    else
      flash[:notice] = "Please correct your errors below!"
      render :new
    end
  end

  def edit
    # @project = Project.find params[:id]
    # redirect_to projects_path, notice: "Access denied" unless can? :edit, @project

  end

  def update
    # redirect_to projects_path, notice: "Access denied" unless can? :update, @project
    # @project = Project.find params[:id]
    if @project.update project_params
      flash[:notice] = "Project updated!"
      redirect_to @project
    else
      flash[:notice] = "Please correct your errors below!"
      render :edit
    end
  end

  def destroy
    # @project = Project.find params[:id]
    @project.destroy
    redirect_to projects_path, notice: "Project deleted!"
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :due_date)
  end

  def find_project
    @project = current_user.projects.find_by_id(params[:id])
    redirect_to root_path, notice: "Access Denied" unless @project
  end

  def restrict_access
    unless can? :manage, @project
      redirect_to root_path, notice: "Access denied"
    end
  end

end
