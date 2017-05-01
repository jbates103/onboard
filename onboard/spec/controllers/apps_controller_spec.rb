require 'rails_helper'
include ControllerHelper

RSpec.describe AppsController, type: :controller do
  describe 'GET index' do
    context 'App index page' do
      before do
        sign_in_user
        @app = create(:app, :reporter_valid, name: 'Darth Vader')
      end

      it 'Correct results from search term with wildcard on right side' do
        get :index, params: { search_term: 'Darth%' }
        expect(response.status).to eq(200)
        expect(response).to render_template(:index)
      end
    end
  end

  describe 'GET show' do
    before do
      sign_in_user
      @app = create(:app, :reporter_valid, name: 'Darth Vader')
    end
     it 'Receives a 302 code' do
       get :show, params: { id: @app.id }
       expect(response.status).to eq(200)
       expect(response).to render_template(:show)
     end
  end

  describe 'GET new' do
    before do
      sign_in_admin
      @app = create(:app, :reporter_valid, name: 'Darth Vader')
    end
     it 'Receives a 200 code' do
       get :new
       expect(response.status).to eq(200)
       expect(response).to render_template(:new)
     end
  end

  describe 'GET edit' do
    before do
      sign_in_admin
      @app = create(:app, :reporter_valid, name: 'Darth Vader')
    end
     it 'Receives a 200 code' do
       get :edit, params: { id: @app.id }
       expect(response.status).to eq(200)
     end
  end
end