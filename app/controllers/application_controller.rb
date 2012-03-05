class ApplicationController < ActionController::Base
  protect_from_forgery

  # User must login into DeRose Connect
  before_filter :authenticate_user!
end
