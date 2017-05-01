require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  describe 'Dashboard Index' do
  	before do
  	  sign_in_user
  	end

    it 'GET index' do
      get :index
      expect(response.status).to eq(200)
    end
  end
end