Rails.application.routes.draw do
  devise_for :users
  root to:'homes#top'
  get'home/about' => 'homes#index'
  resources :users,only:[:new,:show,:index,:edit,:update,:create]
  resources :books,only:[:new, :create, :index, :show, :destroy]
end
