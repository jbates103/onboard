require 'rails_helper'

RSpec.describe StaticController, type: :controller do
  describe 'GET help' do
     it 'Renders the help template' do
       get :help
       expect(response.status).to eq(200)
       expect(response).to render_template(:help)
     end
  end

  describe 'GET contact' do
     it 'Renders the contact template' do
       get :contact
       expect(response.status).to eq(200)
       expect(response).to render_template(:contact)
     end
  end

  describe 'GET about' do
     it 'Renders the about template' do
       get :about
       expect(response.status).to eq(200)
       expect(response).to render_template(:about)
     end
  end
end