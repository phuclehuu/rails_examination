Rails.application.routes.draw do
  resources :items
	root to: 'dashboard#index'
	get :search, controller: :main
	get :languages_no_one_speaks, controller: :main
end
