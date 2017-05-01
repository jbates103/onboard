require 'rails_helper'
include Features::SessionHelper

RSpec.feature 'Dashboard dropdown', type: :feature do
  before do
  	@app = create(:app, :reporter_valid, name: 'Darth Vader')
  	@poc = create(:point_of_contact, email: 'DarthVarder@hotmail.com', first_name: 'Darth', last_name: 'Vader')	
  end

  scenario 'App appears in dropdown when user types first three letters', js: true  do
  	create_and_sign_in_user	
  	visit dash_path
  	fill_in('app-search', with: 'Dar')
  	expect(page).to have_content(@app.name)
  end

  scenario 'App appears in dropdown when user types first three letters', js: true do
  	create_and_sign_in_user	
  	visit dash_path
  	fill_in('poc-search', with: 'Dar')
  	expect(page).to have_content(@poc.first_name)
  	expect(page).to have_content(@poc.last_name)
  end

end