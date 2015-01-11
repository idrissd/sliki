class ApplicationController < ActionController::Base

  before_action :authenticate_user!

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :dt

  def dt(key, options = {})
    options.merge!(:default => t('app.missing')) unless options.key?(:default)
    t(key, options)
  end

end
