class UsersController < ApplicationController
  before_action :set_user, except: [:new, :create, :edit, :update]
  before_action :require_user, except: [:new, :create]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You have successfully registered."
      redirect_to home_path
    else
      render :new
    end
  end

  def edit
    @user = current_user    
  end

  def update
    @user = current_user

    if @user.update(user_params)
      flash[:notice] = "You have successfully updated your information."
      redirect_to home_path
    else
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end

    def set_user
      @user = User.find(params[:id])
    end


end