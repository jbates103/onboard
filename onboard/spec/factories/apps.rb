FactoryGirl.define do
  factory :app do
  	name Faker::App.name
  	app_url Faker::Internet.url
  	user_population '1234567890'
  	sso_technology Faker::Lorem.word
  	comment Faker::Lorem.sentence
  	jira_ticket_id 'USCISICAM-' + Faker::Number.number(4).to_s
  	epic 'USCISICAM-' + Faker::Number.number(4).to_s
  	app_updated Time.now - 2.days
  	app_created Time.now - 3.days

  	trait :reporter_valid do
  	  association :reporter, factory: :point_of_contact
  	end

  	trait :assign_pocs do
  	  association :assignee, factory: :point_of_contact
  	  association :point_of_contacts, factory: :point_of_contact
  	end

  	trait :descriptions do
  		association :descriptions, factory: :description
  	end
  end
end