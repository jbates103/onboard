require 'rails_helper'
include ControllerHelper

RSpec.describe PointOfContactsController, type: :controller do
  describe 'GET index' do
    before do
      sign_in_user
    end

    it 'Receives a 200 code' do
      get :index
      expect(response.status).to eq(200)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET show' do
    before do
      sign_in_user
      @poc = create(:point_of_contact)
    end

     it '' do
       get :show, params: { id: @poc.reload.id }
       expect(response.status).to eq(200)
       expect(response).to render_template(:show)
     end
  end

  describe 'GET new' do
    before do
      sign_in_admin
      @poc = create(:point_of_contact)
    end

    it 'Creates new point of contact' do
      get :new
      expect(response.status).to eq(200)
      expect(response).to render_template(:new)
    end
  end

  describe 'GET edit' do
    before do
      sign_in_admin
      @poc = create(:point_of_contact)
    end

    it 'Can edit and update point of contact' do
      get :edit, params: { id: @poc.id }
      expect(response.status).to eq(200)
      expect(response).to render_template(:edit)
    end
  end

  describe 'Destroy' do
    before do
      sign_in_admin
      @poc = create(:point_of_contact)
    end

    it 'destoys point of contact and redirects' do
      delete :destroy, params: { id: @poc.id }
      expect(response.status).to eq(302)
      expect(response).to redirect_to action: :index
    end
  end
end