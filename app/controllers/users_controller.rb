class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  after_action :clear_session, only: %i[new]

  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)
    @user.admin = true if User.all.empty?

    if @user.save
      session[:user_id] = @user.id
      redirect_to new_car_path
    else
      session[:errors_msg] = @user.errors.messages
      redirect_to new_user_path 
    end
  end

  def update
    if @user.update user_params
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy; end
end

def online_users
  @online_users = User.where(online: true)
end

private
def set_user
  @user = User.find(session[:user_id])
end

#def set_user
#  @user = User.find(params[:id])
#end

def clear_session 
  session.delete(:errors_msg)
end

def user_params
  params.require(:user).permit(
    :name,
    :password,
    :password_confirmation,
    :admin,
    :email
  )
end
