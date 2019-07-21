class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_location, unless: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :kana_first_name, :kana_last_name,
                                                       :postal_code, :address, :phone])
  end

  def after_sign_in_path_for(resource)
    case resource
    when User
      session[:forwarding_url] || root_path
    when Admin
      admins_root_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when :user
      new_user_session_url
    when :admin
      new_admin_session_path
    end
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

end
