class ApplicationController < ActionController::Base
  include HttpResponseConcern
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_out_path_for(resource_or_scope)
  	root_path || referrer.path
  end

  def after_sign_in_path_for(resource_or_scope)
  	 dash_path || stored_location_for(resource_or_scope)
  end

  def user_not_authorized
  	render_401
  end
end
