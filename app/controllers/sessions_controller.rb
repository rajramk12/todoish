class SessionsController < ApplicationController
  def new
  end

  def create
      user = User.find_by(mail: params[:mail])
      if user.present? && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to todos_path
      else
        flash[:danger] ="Invalid User or Password. Try again"
        render "signin"
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
