Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homes#home'
  get 'homes/about'

  devise_for :users

  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:index, :show, :create, :edit, :update, :destroy] do
  	# 投稿へのいいね機能
  	resources :favorites,     only: [:create, :destroy]
  	# 投稿へのコメント機能
  	resources :post_commnets, only: [:create, :destroy]
  end
end
