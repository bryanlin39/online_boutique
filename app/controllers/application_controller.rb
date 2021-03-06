class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  # helper_method :authorize_user, :authorize_admin
  helper_method :current_order

  def authorize_user
    unless current_user
      flash[:alert] = 'You need to sign in to do that.'
      redirect_to new_user_session_path
    end
  end

  def authorize_admin
    unless current_user && current_user.admin
      flash[:alert] = 'You\'re not authorized to do that.'
      redirect_to '/'
    end
  end

  def current_order
    if session[:order_id]
      Order.find(session[:order_id])
    elsif current_user && Order.in_progress(current_user).first
      Order.in_progress(current_user).first
    else
      Order.new
    end
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

end
