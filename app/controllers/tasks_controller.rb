class TasksController < ApplicationController
  before_action :find_project
  
  def show
    @project = Project.find params[:id]
  end

  def new
    @task = Task.new
  end

  def create
    # @project = Project.find params[:project_id]
    @task = Task.new task_params
    @task.project = @project
    
    if @task.save
      redirect_to @project, notice: "Task created successfully!"
    else
      redirect_to @project
    end
  end

  def edit
    @task = Task.find params[:id]
  end

  def update
    @task = Task.find params[:id]
    if @task.update task_params
      flash[:notice] = "Task updated!"
      redirect_to @project
    else
      flash[:notice] = "Please correct your errors below!"
      render :edit
    end
  end

  def destroy
    @task = Task.find params[:id]
    @task.destroy
    redirect_to @task.project, notice: "Task deleted!"
  end

  private

  def task_params
    params.require(:task).permit(:title, :due_date) 
  end

  def find_project
    @project = Project.find params[:project_id] 
  end

end