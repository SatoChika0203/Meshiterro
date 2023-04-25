Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "homes/about" => "homes#about", as: "about"
  resources :post_images, only: [:new,:create,:index,:show,:destroy]
  # get 'post_images/new'
  # get 'post_images/index'
  # get 'post_images/show'
  
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  resource :favorites, only: [:create, :destroy]
    # 単数形にすると、/:idがURLに含まれなくなる
  resources :post_comments, only: [:create, :destroy]
  end
  # 投稿画像に対してコメントされるため、post_commentsは、post_imagesに結びつく
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
