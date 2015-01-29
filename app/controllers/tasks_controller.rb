class TasksController < ApplicationController
  # before_action :find_project
  
  def show
    @task = Task.find params[:id]
  end

  def new
    @task = Task.new
  end

  def create
    @project = Project.find params[:project_id]
    @task = Task.new task_params
    @task.project = @project
    
    if @task.save
      flash[:notice] = "Your Task has been created successfully!"
      redirect_to @project
    else
      flash[:notice] = "Please correct your errors below!"
      redirect_to @project
    end
  end

  def edit
    @project = Project.find params[:project_id]
    @task = Task.find params[:id]
  end

  def update
    @project = Project.find params[:project_id]
    @task = Task.find params[:id]
    if @task.update task_params
      flash[:notice] = "Your task has been updated!"
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

  # def find_project
  #   @project = Project.find params[:project_id] 
  # end

end