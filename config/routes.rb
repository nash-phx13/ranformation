Rails.application.routes.draw do
get 'search/search'
devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: 'homes#top'
get '/home/about' => 'homes#about'
#記事の投稿、いいね、コメント
resources :runs, only: [:index, :show, :edit, :create, :destroy, :update]do
  resource :likes, only: [:create, :destroy]
  resources :run_comments, only: [:create, :destroy]
end

#ユーザー情報
resources :users, only: [:index, :show, :edit, :update]

#検索機能
get '/search', to: 'search#search'
end