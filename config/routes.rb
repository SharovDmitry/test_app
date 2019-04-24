Rails.application.routes.draw do
  devise_for :users, path: '', skip: 'registrations'
  devise_scope :user do
    get 'sign_up', to: 'devise/registrations#new', as: 'new_user_registration'
    post 'sign_up', to: 'devise/registrations#create', as: 'user_registration'
  end
end
