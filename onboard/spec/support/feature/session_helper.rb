module Features
  module SessionHelper
  	PASSWORD = "Password1!"

  	def sign_up_user
  	  visit new_user_registration_path
  	  fill_in 'user_email', with: 'user21@gmail.com'
  	  fill_in 'user_password', with: 'Password1!'
  	  fill_in 'user_password_confirmation', with: 'Password1!'
  	  submit_form
  	end

  	def create_user(user = create(:user))
 	  return user
  	end

  	def create_tech_user(tech = create(:user, :tech))
  	  return tech
  	end

  	def create_admin_user(admin = create(:user, :admin))
  	  return admin
  	end

  	def create_and_sign_in_user
  	  user = create_user
  	  visit new_user_session_path
  	  fill_in 'user_email', with: user.email
  	  fill_in 'user_password', with: 'Password1!'
  	  submit_form
  	end

  	def submit_form
  	  find('input[name="commit"]').click
  	end
  end
end