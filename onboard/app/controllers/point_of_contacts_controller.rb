class PointOfContactsController < ApplicationController
  after_action :verify_authorized
  before_action :set_point_of_contact, only: [:show, :edit, :update]

  def index
  	@point_of_contacts = PointOfContact.all	
  	authorize @point_of_contacts
  end

  def show
  	authorize @point_of_contact
    @apps = @point_of_contact.apps
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

  private

  def permitted_params
  	params.require(:point_of_contact).permit(:first_name, :last_name, :email, :phone, :department)
  end

  def set_point_of_contact
  	@point_of_contact = PointOfContact.find(params[:id])
  end
end
