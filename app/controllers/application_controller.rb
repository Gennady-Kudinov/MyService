class ApplicationController < ActionController::Base

    helper_method :user_signed_in?, :current_user 
   
 
    private 

    def authenticate_user! 
      redirect_to new_user_path unless current_user 
    end

    def current_user 
      @current_user ||= User.find_by(id: session[:user_id])  if session[:user_id].present? 
    end

    def user_signed_in? 
      current_user
    end
end
