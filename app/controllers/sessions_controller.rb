class SessionsController < ApplicationController

  def new
    @user = User.new 
  end

  def create
    @user = User.find_by(name: user_params[:name])

    if @user.try(:authenticate, user_params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to login_url 
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private 

  def user_params  
    params.require(:user).permit(:name, :password)
  end
end
