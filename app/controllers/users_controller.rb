class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    @users = User.all
    @users = User.order(:name)
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id 
      redirect_to new_car_path 
    else
      render :new 
    end
  end

  def update


  end

  def destroy
  end

end

private
def set_user
  @user = User.find(params[:id])
end

def user_params
  params.require(:user).permit(:name, :password, :password_confirmation)
end
