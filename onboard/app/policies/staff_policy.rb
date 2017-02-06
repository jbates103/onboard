class StaffPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
  	@current_user = current_user
  	@staff = model
  end

  def login_process?
  	Staff.exists?(email: current_user.email)
  end

  def new?
  	current_user.admin?
  end

  def create?
  	current_user.admin?
  end

  def destroy?
  	current_user.admin?
  end

  def edit?
  	current_user.admin?
  end
end