require 'rails_helper'
include PointOfContactHelper

RSpec.describe PointOfContact, type: :model do 

  it 'not valid without first name' do
  	point_of_contact = PointOfContact.new(params_without_first)
  	expect(point_of_contact).to_not be_valid
  end

  it 'not valiid without last name' do
  	point_of_contact = PointOfContact.new(params_without_last)
  	expect(point_of_contact).to_not be_valid
  end

   it 'not valiid without email' do
  	point_of_contact = PointOfContact.new(params_without_email)
  	expect(point_of_contact).to_not be_valid
  end

  it 'valiid without phone and department' do
  	point_of_contact = PointOfContact.new(valid_params)
  	expect(point_of_contact).to be_valid
  	expect(point_of_contact.errors).to be_empty
  end

  it 'not valid with invalid email' do
  	point_of_contact = PointOfContact.create(all_params)
  	point_of_contact.email = 'no_email'
  	expect(point_of_contact).to_not be_valid
  	expect(point_of_contact.save).to be_falsey
  end

  describe 'validations' do
  	it { should validate_presence_of :first_name }
  	it { should validate_presence_of :last_name }
  	it { should validate_presence_of :email }
  	it { should validate_uniqueness_of(:last_name).scoped_to(:first_name) }
  end

  describe 'associations' do
  	it { should have_and_belong_to_many(:apps).dependent(:delete) }
  	it { should have_one(:assignee).with_foreign_key(:assignee_id).dependent(:nullify) }
  	it { should have_one(:reporter).with_foreign_key(:reporter_id) }
  end
end