class DashboardController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def index
    @app = App.new
    @apps = App.all
    authorize :staff, :login_process? 
  end

  def user_not_authorized
  	sign_out current_user
    flash[:danger] = I18n.t('onboard.controllers.dashboard.index.unauthorized')
    redirect_to after_sign_out_path_for(:user)
  end
end
