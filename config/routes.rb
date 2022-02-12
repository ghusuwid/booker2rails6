Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get '/home/about' => 'homes#about', as: 'about'
resources :users, only: [:show, :edit, :index, :update]
resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]



end
