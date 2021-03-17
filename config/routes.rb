Rails.application.routes.draw do
  devise_for :users
  root to:'homes#top'
  get'home/about' => 'homes#index'
  resources :users,only:[:show,:index]
  resources :books,only:[:new, :create, :index, :show, :destroy]
end
