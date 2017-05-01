FactoryGirl.define do
  factory :point_of_contact do
  	email Faker::Internet.free_email
  	first_name Faker::Name.first_name
  	last_name Faker::Name.last_name
  	phone '98776512345'
  	department Faker::Educator.course
  end
end