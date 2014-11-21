class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, except: [:index, :new, :create]
  before_action :require_user

  def index
    @tasks = @project.tasks
  end

  def new
    @task = Task.new
    session[:last_page] = request.env['HTTP_REFERER']
  end

  def create
    @task = Task.new(task_params)
    @task.assigned_to = current_user
    @project.tasks << @task
    current_user.tasks << @task

    binding.pry

    if @task.save
      flash[:notice] = "Task was successfully created."
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def edit 
    session[:last_page] = request.env['HTTP_REFERER']   
  end

  def update
    if task_params[:completed]
      @task.completed_on = Date.today
    end
    
    if @task.update(task_params)
      flash[:notice] = "Task was successfully updated."
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    flash[:notice] = "Task was successfully deleted."
    redirect_to project_path(@project)
  end

  def complete
    if @task.completed
      @task.completed = false
      @task.completed_on = nil
    else
      @task.completed = true
      @task.completed_on = Date.today
    end

    @task.save

    respond_to do |format|
      format.js {}
    end
  end


  private
    def task_params
      params.require(:task).permit(:name, :due_on, :note, :project_id, :completed)
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_task
      @task = Task.find(params[:id])
    end

end