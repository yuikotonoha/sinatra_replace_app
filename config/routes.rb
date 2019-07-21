Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'posts#index'
  resources :posts
  resources :comments

  # お気に入り追加・削除
  get '/likes/:id', to: 'likes#touch'

  # フォロー・アンフォロー
  get '/follow/action', to: 'follows#touch'

  resources :users, only: [:index,:show]

end
