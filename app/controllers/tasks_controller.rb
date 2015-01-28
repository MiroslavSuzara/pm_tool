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
      render "projects/show"
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