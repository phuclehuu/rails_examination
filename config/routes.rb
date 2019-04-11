Rails.application.routes.draw do
  resources :items
	root to: 'dashboard#index'
	get :search, controller: :main
end
