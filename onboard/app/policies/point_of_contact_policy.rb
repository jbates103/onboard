module PointOfContactPolicy
  attr_reader :current_user, :poc

  def initialize(current_user, model)
  	@current_user = current_user
  	@poc = model
  end

  def show?
    true
  end

  def index?
    true
  end

  def create?
  	current_user.admin?
  end

  def edit?
  	current_user.admin?
  end

  def new?
  	current_user.admin?
  end

  def destroy?
  	current_user.admin?
  end
end