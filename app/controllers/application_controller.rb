class ApplicationController < ActionController::Base
  protect_from_forgery  with: :exception
  helper_method :current_user, :logged_in?, :isadmin?

  protected
    def current_user
      if session[:user_id]
        begin
          @current_user = User.find_by(id: session[:user_id])
        rescue ActiveRecord::RecordNotFound => e
          redirect_to root_path
        end
      end
    end

    def logged_in?
      !!current_user
    end

    def isadmin?
      if logged_in? && @current_user.isadmin?
        return true
      end
    end

    def require_user
      if !logged_in?
        flash[:alert] = 'access denied. Please login'
        redirect_to signin_path
      end
    end
end
