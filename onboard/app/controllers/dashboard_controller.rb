class DashboardController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def index
    @apps = App.sample_data
    @new_poc = PointOfContact.new_entries(current_user.last_sign_in_at)
    @new_apps = App.new_entries(current_user.last_sign_in_at)
    authorize :staff, :login_process? 
  end

  def user_not_authorized
  	sign_out current_user
    flash[:danger] = I18n.t('onboard.controllers.dashboard.index.unauthorized')
    redirect_to after_sign_out_path_for(:user)
  end
end
