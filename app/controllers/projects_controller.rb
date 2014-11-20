class ProjectsController < ApplicationController
  before_action :set_project, except: [:index, :new, :create]
  before_action :require_user

  def index
    @projects = current_user.projects
  end

  def show
    @task = Task.new
  end

  def new
    @project = Project.new
    session[:last_page] = request.env['HTTP_REFERER']
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user

    if @project.save
      flash[:notice] = "Project was succesfully created."
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def edit
    session[:last_page] = request.env['HTTP_REFERER']
  end

  def update
    if @project.update(project_params)
      flash[:notice] = "Project was successfully updated."
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    flash[:notice] = "Project was successfully deleted."
    redirect_to projects_path
  end


  private
    def project_params
      params.require(:project).permit(:name, :due_on, :description)
    end

    def set_project
      @project = Project.find(params[:id])
    end

end