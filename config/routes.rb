Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  get 'rank' => 'alchools#rank'
  root 'homes#top'
  get 'home/about' => 'homes#about',as:'about'
  resources :alchools do
    resources :alcool_comments,only: [:destroy, :create]
    resource :favorites,only: [:destroy, :create]
  end
 end
