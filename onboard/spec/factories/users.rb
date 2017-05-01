
FactoryGirl.define do
  factory :user do
    email Faker::Internet.free_email
    password 'Password1!'
    password_confirmation 'Password1!'
    confirmed_at Time.now
    confirmation_token Faker::Crypto.sha1
    confirmation_sent_at Time.now - 2.days
    created_at Time.now - 1.days
    updated_at Time.now
    role 0

    trait :admin do
      role 1
    end

    trait :tech do
      role 2
    end
  end
end