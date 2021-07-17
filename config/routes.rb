Rails.application.routes.draw do
devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: 'homes#top'
get '/home/about' => 'homes#about'
#記事の投稿、いいね、コメント
resources :runs, only: [:index, :show, :edit, :create, :destroy, :update]do
  resource :likes, only: [:create, :destroy]
  resources :run_comments, only: [:create, :destroy]
  resources :reviews, only: [:create, :edit, :update, :destroy]
end

#ユーザー情報
resources :users, only: [:index, :show, :edit, :update] do
  	resource :relationships, only: [:create, :destroy]
  	get 'followings' => 'relationships#followings', as: 'followings'
  	get 'followers' => 'relationships#followers', as: 'followers'
  end

#検索機能
get '/search', to: 'search#search'
end