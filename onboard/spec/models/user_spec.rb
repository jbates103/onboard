require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'association' do
  	it { should have_and_belong_to_many(:second_factors) }
  end


  it 'responds to role enum' do
  	should define_enum_for(:role).
  	  with({ user: 0, admin: 1, tech: 2 })
  end
end