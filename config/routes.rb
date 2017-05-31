Rails.application.routes.draw do
	root 'posts#index'

	get 'signin', to: 'sessions#new'
	post 'signin', to: 'sessions#create'
	delete 'signout', to: 'sessions#destroy'
	post 'posts/new', to: 'posts#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htmlroot 'static_pages#home'
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts, only: [:new, :create, :index]
end
