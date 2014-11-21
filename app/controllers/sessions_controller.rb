class SessionsController < ApplicationController
  before_action :require_user, except: [:welcome, :home, :new, :create]

  def welcome
  end

  def home
    if !logged_in?
      render :welcome
    end
  end

  def new
  end

  def create
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "You have successfully logged in."
      redirect_to home_path
    else
      flash[:error] = "Your username or password was incorrect."
      redirect_to home_path
    end

  end

def destroy
    session[:user_id] = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to root_path
  end

  def profile
  end

  def projects
    @project = Project.new
  end

  def tasks
    @task = Task.new
  end


end