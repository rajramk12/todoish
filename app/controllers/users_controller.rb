class UsersController < ApplicationController
  before_action :require_user, only:[ :update, :edit]
  before_action :set_user, only: [:show, :update, :edit, :destroy]
  before_action :require_admin, only:[ :destroy ]

  def index
    if isadmin? && logged_in?
      @users = User.all
    elsif logged_in?
      set_user
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'User Created!'
      session[:user_id] = @user.id
      redirect_to todos_path
    else
      flash[:error] = 'Error in Creation'
      render "new"
      end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'User updated'
    else
      flash[:error] = 'failed to update'
    end
    redirect_to users_path
  end

  def destroy
    if @user.isadmin?
      flash[:error] = "Admin User. Can't be deleted"
    else
      if @user.delete
        flash[:success] = 'User removed!'
      else
        flash[:error] = 'Error in Creation'
      end
    end
    redirect_to users_path
  end


  private
    def set_user
      if session[:user_id]
        @user = User.find_by(id: params[:id])
      end
    end

    def require_user
      if @current_user  != @user
        redirect_to signin_path
      end
    end

    def user_params
      params.require(:user).permit(:name,:mail,:password, :password_confirmation)
    end

    def require_admin
      if !isadmin? && !logged_in?
        flash[:error] = 'Admin functionality. Please check your access!'
      end
    end

end
