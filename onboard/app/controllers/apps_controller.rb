class AppsController < ApplicationController
  include SearchTermConcern
  before_action :authenticate_user!
  before_action :set_app, only: [:show, :edit, :update]
  after_action :verify_authorized, except: :search_app


  def index
    @apps =  search_term? ? App.where('name LIKE ?', search_term).page(params[:page]) : App.page(params[:page])
  	authorize App
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
  	  redirect_to app_path(@app)
  	else
  	  flash[:error] = t('onboard.controllers.apps.update.failure')
  	  render :index
  	end
  end

  def new
  	@app = App.new
    authorize @app
  	@point_of_contacts = PointOfContact.all
  end

  def create
  	@app = App.new(permitted_params)
  	authorize @app

  	if @app.save
  	  flash[:success] = t('onboard.controllers.apps.create.success')
  	  redirect_to app_path(@app)
  	else
  	  flash[:error] = t('onboard.controllers.apps.create.failure')
  	  render :index
  	end
  end

  def destroy
  	app = Apps.find(params[:id])
  	authorize app
    if app.destroy
  	  flash[:success] = t('onboard.controllers.apps.destroy.success')
  	  redirect_to apps_path
  	else
  	  flash[:error] = t('onboard.controllers.apps.destroy.failure')
  	  render :index
  	end
  end

  def search_app
    @apps = App.where("LOWER(name) LIKE ?", "%#{lowercase_name}%")
    respond_to do |format|
      format.html
      format.json { render json: @apps }
    end
  end

  private

  def permitted_params
  	params.require(:app).permit(
      :name, :url, :user_population, :jira_ticket_id, :epic,
         :sso_technology, :comment, :description, :status, :app_updated, :app_created, :reporter, :assignee,
          point_of_contact_ids: []
        )
  end

  def set_app
    @app = App.find(params[:id])
  end
end