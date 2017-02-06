class DashboardController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def index
    @apps = Apps.all
    authorize :staff, :login_process? 
  end

  def user_not_authorized
  	flash[:error] = I18n.t('onboard.error.controllers.index.unauthorized')
  	sign_out current_user
  end
end
