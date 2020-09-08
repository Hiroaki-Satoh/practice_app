Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homes#home'
  get 'homes/about'

  devise_for :users

  resources :users, only: [:index, :show, :edit, :update] do
    # フォロー・フォロワー機能
    resource :relationships, only: [:create, :destroy]
    get 'follows'   => 'relationships#follower', as: 'follows'
    get 'followers' => 'relationships#followed', as: 'followers'
  end

  resources :books, only: [:index, :show, :create, :edit, :update, :destroy] do
  	# 投稿へのいいね機能
  	resource :favorites,     only: [:create, :destroy]
  	# 投稿へのコメント機能
  	resource :post_comments, only: [:create, :destroy]
  end
end
