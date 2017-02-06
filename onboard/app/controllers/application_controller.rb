class ApplicationController < ActionController::Base
  include HttpResponseConcern
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_out_path_for(resource_or_scope)
  	request.referrer || root_path
  end

  def user_not_authorized
  	render_401
  end
end
