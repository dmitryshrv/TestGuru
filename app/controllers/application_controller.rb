class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  protected

  def after_sign_in_path_for(current_user)
    current_user.admin? ? admin_tests_path : root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def default_url_options
    I18n.locale == I18n.default_locale ? {} : {lang: I18n.locale}
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang]: I18n.default_locale
  end

end
