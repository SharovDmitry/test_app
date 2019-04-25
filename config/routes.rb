Rails.application.routes.draw do
  devise_for :users, path: '', skip: 'registrations'
  devise_scope :user do
    get 'sign_up', to: 'devise/registrations#new', as: 'new_user_registration'
    post 'sign_up', to: 'users/registrations#create', as: 'user_registration'
  end

  resources :secret_codes, only: [:index, :create]
end
