Rails.application.routes.draw do
	root to: 'articles#front_page'
 resources :articles do
    resources :comments
end


resources :tags
resources :authors
resources :author_sessions, only: [ :new, :create, :destroy ]

get 'login'  => 'author_sessions#new'
get 'logout' => 'author_sessions#destroy'
get 'front_page' => 'articles#front_page'
#get 'index' => 'articles#index'
end

