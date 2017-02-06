class AppsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_app, only: [:show, :edit, :update]
  after_action :verify_authorized


  def index
  	@apps = Apps.all
  	authorize Apps
  end

  def show
  	authorize @app
  end

  def edit
    authorize @app
  	@point_of_contacts = PointOfContact.all
  end

  def update
  	authorize @app
  	if @app.update(permitted_params)
  	  flash[:success] = t('onboard.controllers.apps.update.success')
  	  redirect_to #redirect_url
  	else
  	  flash[:error] = t('onboard.controllers.apps.update.failure')
  	  render :index
  	end
  end

  def new
  	@app = Apps.new
    authorize @app
  	@point_of_contacts = PointOfContact.all
  end

  def create
  	@app = Apps.new(permitted_params)
  	authorize @app

  	if @app.save
  	  flash[:success] = t('onboard.controllers.apps.create.success')
  	  redirect_to #
  	else
  	  flash[:error] = t('onboard.controllers.apps.create.failure')
  	  render :index
  	end
  	
  end

  def destroy
  	app = Apps.find(params[:id])
  	if app.destroy
  	  flash[:success] = t('onboard.controllers.apps.destroy.success')
  	  redirect_to redirect_url =  #dashboard
  	else
  	  flash[:error] = t('onboard.controllers.apps.destroy.failure')
  	  render :index
  	end
  end

  private

  def permitted_params
  	params.require(:app).permit(
      :name, :url, owner_id: [], :user_population, :jira_ticket_id, :epic
         :sso_technology, :comment, :description, :status, :app_updated, :app_created
        )
  end

  def set_app
  	@app = Apps.find(params[:id])
  end
end
