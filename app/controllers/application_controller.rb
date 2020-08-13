class ApplicationController < ActionController::Base

  before_action :basic_auth
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:lastname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname_furigana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:lastname_furigana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:birthday])
  end
end
