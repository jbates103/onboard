require 'rails_helper'

RSpec.describe Description, type: :model do

  describe 'associations' do
  	it { should have_and_belong_to_many(:apps).dependent(:delete) }
  end

  describe 'validations' do
  	it { should validate_presence_of :text }
  end
end