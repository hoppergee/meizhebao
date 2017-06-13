class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_locale

  before_action :set_timezone

  def set_locale
    if params[:locale] && I18n.available_locales.include?( params[:locale].to_sym )
      session[:locale] = params[:locale]
    end

    I18n.locale = session[:locale] || I18n.default_locale
  end

  def set_timezone
    if current_user && current_user.time_zone
      Time.zone = current_user.time_zone
    end
  end

  helper_method :current_cart

  def current_cart
  	@current_cart ||= find_cart
  end

  def admin_required
    current_user.admin?
  end

  private
  def find_cart
  	cart = Cart.find_by(id: session[:cart_id])
  	if cart.blank?
  		cart = Cart.create
  	end
  	session[:cart_id] = cart.id
  	return cart
  end


  def find_cart1
    
  end

  protected
  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs<<:current_password
  end

end
