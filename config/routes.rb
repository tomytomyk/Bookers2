Rails.application.routes.draw do

  root to: 'root#top'
  devise_for :users
  get '/root/show' => 'root#show'

  resources :users, only: [:new, :create, :index, :show, :edit, :update]
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
