Rails.application.routes.draw do
  get 'search/search'
  devise_for :users
  root to:'homes#top'
  get'home/about' => 'homes#about'
  get'/search' => 'search#search'

  resources :books do
    resource :favorites,only:[:create,:destroy]
    resources :book_comments,only:[:create,:destroy]
  end
  resources :users,only:[:create,:index,:show,:edit,:update] do
    resources :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

end
