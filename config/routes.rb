Rails.application.routes.draw do
	get 'guides/:guide_id/reviews', to: 'reviews#index', as: :guide_reviews
	post 'guides/:guide_id/reviews', to: 'reviews#create'
	delete 'guides/:guide_id/reviews/:id', to: 'reviews#destroy', as: :review

	root to: 'dashboard#index'
	get :search, controller: :main
	get :languages_no_one_speaks, controller: :main

	namespace :api do
		namespace :v1 do
			resources :guides, only: [:index] do
			end
		end
	end
end
