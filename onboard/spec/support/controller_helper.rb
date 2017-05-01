module ControllerHelper
  def sign_in_user(user = create(:user))
  	sign_in user
  	user
  end

  def sign_in_admin(admin = create(:user, :admin))
	  sign_in admin
	  admin 	
  end

  def sign_in_tech(tech = create(:user, :tech))
    sign_in tech
    tech
  end
end