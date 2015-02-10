class TasksController < ApplicationController
  # before_action :find_project
    before_action :authenticate_user!
    # before_action :restrict_access, only: [:destroy]

  def show
    @task = Task.find params[:id]
  end

  def new
    @task = Task.new
  end

  def create
    @project = Project.find params[:project_id]
    @task = @project.tasks.new task_params
    # @task = Task.new task_params
    # @task.project = @project
    @task.user = current_user
    
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

  # def destroy
  #   @task = Task.find params[:id]
  #   @task.destroy
  #   redirect_to @task.project, notice: "Task deleted!"
  # end

  def destroy
    @task = Task.find params[:id]
    if @task.user = current_user && @task.destroy
      redirect_to @task.project, notice: "Task deleted"
    else
      redirect_to @task.project, error: "We had trouble deleting the Task"
    end
  end


  def done
    @task = Task.find params[:id]

    if @task.status == false
      @task.status = true
      @task.save
      redirect_to @task.project, notice: "You have marked the Task as Done!"
    elsif @task.status == true
      @task.status = false
      @task.save
      redirect_to @task.project, notice: "You have marked a Task as Not Done!"
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :due_date) 
  end

  # def find_project
  #   @project = Project.find params[:project_id] 
  # end

  # def restrict_access
  #   unless can? :manage, @task
  #     redirect_to root_path, notice: "Access denied"
  #   end
  # end

end