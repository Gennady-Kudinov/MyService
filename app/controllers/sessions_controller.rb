class SessionsController < ApplicationController

  def new
    @user = User.new 
  end

  def create
    @user = User.find_by(name: params[:name])

    if @user.try(:authenticate, params[:password])
      session[:user_id] = @user.id
      redirect_to admin_url
    else
      redirect_to login_url, alert: "Invalid user/password combination" end
    end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "До свидания"
  end
end
