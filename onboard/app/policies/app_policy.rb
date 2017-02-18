class AppPolicy 
  attr_reader :current_user, :app

  def initialize(current_user, model)
  	@current_user = current_user
  	@app = model
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
  	current_user.admin? || @app.point_of_contacts.exists(email: current_user.email)
  end

  def update?
    current_user.admin? || @app.point_of_contacts.exists(email: current_user.email)
  end
end