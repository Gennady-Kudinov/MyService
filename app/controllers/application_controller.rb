class ApplicationController < ActionController::Base
  helper_method :user_signed_in?, :current_user, :superadmin?, :admin?
  skip_before_action :verify_authenticity_token, only: [:delete_all_clients]

  private

  def authenticate_user!
    redirect_to new_user_path unless current_user
  end

  def check_user_admin!
    redirect_to root_path unless current_user.admin
  end

  def current_user
    if session[:user_id].present?
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def user_signed_in?
    current_user
  end

  def superadmin?
    User.first.present? ? User.first == current_user : nil
  end

  def admin?
    current_user.admin
  end

  def delete_all_clients
    send_file "#{Rails.root}/app/assets/javascripts/delete_all_clients.js",
    type: 'text/javascript', disposition: 'inline'
  end

end
