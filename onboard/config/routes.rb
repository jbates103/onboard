Rails.application.routes.draw do

  root to: redirect('/sign_in')

  devise_for :users, skip: [:sessions], controllers: {
  	registrations: 'users/registrations',
  	confirmations: 'users/confirmations',
  	passwords: 'users/passwords',
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  devise_scope :user do
    get '/sign_in' => 'users/sessions#new', as: :new_user_session
    post '/sign_in' => 'users/sessions#create', as: :user_session
  end

  resources :users
end
