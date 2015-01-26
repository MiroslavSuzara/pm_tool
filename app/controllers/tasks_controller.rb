class TasksController < ApplicationController
  before_action :find_project
  
  def show
    @project = Project.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task          = Task.new task_params
    @task.project = @project
    if @task.save
      redirect_to @project, notice: "Task created successfully!"
    else
      render "projects/show"
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :due_date) 
  end

  def find_project
    @project = Project.find params[:project_id] 
  end

end
