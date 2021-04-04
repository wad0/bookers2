Rails.application.routes.draw do
  devise_for :users
  root to:'homes#top'
  get'home/about' => 'homes#about'
  resources :books do
    resource :favorites,only:[:create,:destroy]
    resources :book_comments,only:[:create,:destroy]
  end
  resources :users,only:[:create,:index,:show,:edit,:update]
end
