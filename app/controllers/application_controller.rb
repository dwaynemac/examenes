class ApplicationController < ActionController::Base
  protect_from_forgery

  # User must login into DeRose Connect
  before_filter :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
end
