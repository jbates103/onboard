require 'rails_helper'

RSpec.describe App, type: :model do

  it 'reponds to status enum' do
  	should define_enum_for(:status).
  	  with({ not_started: 0, in_progress: 1, blocked: 2, completed: 3, done: 4, accepted: 5 })
  end

  it 'reponds to label enum' do
  	should define_enum_for(:label).
  	  with({ dt: 0, pt: 1, dm: 2, preprod: 3, prod: 4 })
  end

  describe 'associations' do
  	it { should have_and_belong_to_many(:point_of_contacts).dependent(:delete) }
  	it { should have_and_belong_to_many(:descriptions).dependent(:delete) }
  	it { should belong_to(:assignee) }
  	it { should belong_to(:reporter) }
  end

  describe 'validations' do
  	it { should validate_presence_of :name }
  	it { should validate_presence_of :reporter }
  end
end