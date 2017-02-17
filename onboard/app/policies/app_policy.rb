class AppPolicy 
  attr_reader :current_user, :apps

  def initialize(current_user, model)
  	@current_user = current_user
  	@apps = model
  end

  def show?
    true
  end

  def index?
  	true
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