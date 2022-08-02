class UsersController < ApplicationController
  before_action :require_user, only:[ :update, :edit, :destroy]
  before_action :set_user, only: [:show, :update, :destroy, :edit]

  def index
    if isadmin?
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
      flash[:error] = 'User Created!'
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
  end

  def destroy
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

end
