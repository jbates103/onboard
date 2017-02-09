class StaffsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_staff, only: [:edit, :update]
  after_action :verify_authorized


  def index
  	@staffs = Staff.all
  	authorize Staff
  end

  def new
  	@staff = Staff.new
  	authorize @staff
  end

  def create
  	@staff = Staff.new(permitted_params)
  	authorize @staff

  	if @staff.save
  	  flash[:success] = t('onboard.controllers.staff.create.success')
  	  redirect_to staff_path(@staff)
  	else
  	  flash[:error] = t('onboard.controllers.staff.create.failure')
  	  render :new
  	end
  end

  def destroy
  	staff = Staff.find(param[:id])
  	authorize staff

  	if staff.destroy
  	  flash[:success] = t('onboard.controllers.staff.destroy.success')
  	  redirect_to staffs_path
  	else
  	  flash[:error] = t('onboard.controllers.staff.destroy.failure')
  	  render :index
  	end
  end

  def edit
  	authorize @staff
  end

  def update
  	authorize @staff

  	if @staff.update(permitted_params)
  	  flash[:success] = t('onboard.controllers.staff.udpate.success')
  	  redirect_to staff_path(@staff)
  	else
  	  flash[:error] = t('onboard.controllers.staff.update.failure')
  	  render :edit
  	end
  end

  private

  def permitted_params
  	params.require(:staff).permit(:first_name, :last_name, :email)
  end

  def set_staff
  	@staff = Staff.find(params[:id])
  end
end
