Rails.application.routes.draw do

  root 'products#index'
  get '/about'              => 'home#about'
  get '/contact'            => 'home#contact'
  post '/contact_submit'    => 'home#contact_submit'

  resources :users, only: [:new, :create]
  resources :admin, only: [:index]
  resources :favorites, only: [:index]

  resources :products, shallow: true do
    resources :reviews, only: [:new, :create, :destroy]
    resources :favorites, only: [:create, :destroy]
  end

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

end
