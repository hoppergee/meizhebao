class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

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

  protected
  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs<<:current_password
  end

end
