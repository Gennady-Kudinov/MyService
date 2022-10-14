class ApplicationController < ActionController::Base

    helper_method :user_signed_in?, :current_user, :superadmin?, :admin? 
   
 
    private 

    def authenticate_user! 
      redirect_to new_user_path unless current_user 
    end

    def check_user_admin! 
      redirect_to root_path unless current_user.admin
    end

    def current_user 
      @current_user ||= User.find_by(id: session[:user_id])  if session[:user_id].present? 
    end

    def user_signed_in? 
      current_user
    end

    def superadmin? 
      User.first == current_user  
    end

    def admin? 
      current_user.admin 
    end
end
