class PointOfContactsController < ApplicationController
  include AjaxParamsConcern
  before_action :authenticate_user!
  before_action :set_point_of_contact, only: [:show, :edit, :update]
  after_action :verify_authorized, except: :search_poc

  def index
  	@point_of_contacts = search_term? ? 
      PointOfContact.where('email LIKE ? or first_name LIKE ? or last_name LIKE ?', 
        lowercase_name, lowercase_name, lowercase_name).page(params[:page]) :
         PointOfContact.page(params[:page])
  	authorize PointOfContact
  end

  def show
  	authorize @point_of_contact
    @own = @point_of_contact.apps
    @reporting = App.all_reporter_apps(@point_of_contact.id)
    @assigned = App.all_assignee_apps(@point_of_contact.id)
  end

  def new
  	@point_of_contact = PointOfContact.new
  	authorize @point_of_contact
  end

  def create
  	@point_of_contact = PointOfContact.new(permitted_params)
  	authorize @point_of_contact

  	if @point_of_contact.save
  	  flash[:success] = t('onboard.controllers.point_of_contact.create.success')
  	  redirect_to point_of_contact_path(@point_of_contact)
  	else
  	  flash[:error] = t('onboard.controllers.point_of_contact.create.failure')
  	  render :index
  	end
  end

  def destroy
  	point_of_contact = PointOfContact.find(params[:id])
  	authorize point_of_contact
  	
    App.replace_delete_reporter(point_of_contact.id)
  	if point_of_contact.destroy
  	  flash[:success] = t('onboard.controllers.point_of_contact.destroy.success')
  	  redirect_to point_of_contacts_path
  	else
  	  flash[:error] = t('onboard.controllers.point_of_contact.destroy.failure')
  	  render :index
  	end
  end

  def edit
  	authorize @point_of_contact
  end

  def update
  	authorize @point_of_contact

  	if @point_of_contact.update(permitted_params)
  	  flash[:success] = t('onboard.controllers.point_of_contact.udpate.success')
  	  redirect_to point_of_contact_path(@point_of_contact)
  	else
  	  flash[:error] = t('onboard.controllers.point_of_contact.udpate.failure')
  	  render :index
  	end
  end

  def search_poc
    @pocs = PointOfContact.where("LOWER(email) LIKE ? OR LOWER(first_name) LIKE ? OR LOWER(last_name) LIKE ?",
       "%#{search_term_lower}%", "%#{search_term_lower}%", "%#{search_term_lower}%")
    respond_to do |format|
      format.html
      format.json { render json: @pocs }
    end
  end

  private

  def permitted_params
  	params.require(:point_of_contact).permit(:first_name, :last_name, :email, :phone, :department)
  end

  def set_point_of_contact
  	@point_of_contact = PointOfContact.find(params[:id])
  end

end
