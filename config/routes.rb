Rails.application.routes.draw do
  devise_for :users
  root to:'homes#top'
  get'home/about' => 'homes#index'
  resources :books
  resources :users,only:[:new,:create,:index,:show,:edit,:update]
end
