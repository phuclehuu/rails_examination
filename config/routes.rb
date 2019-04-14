Rails.application.routes.draw do
	# resources :guides do
	# 	resources :reviews, shallow: true
  # end
	get 'guides/:guide_id/reviews', to: 'reviews#index', as: :guide_reviews
	post 'guides/:guide_id/reviews', to: 'reviews#create'
	delete 'guides/:guide_id/reviews/:id', to: 'reviews#destroy', as: :review

	root to: 'dashboard#index'
	get :search, controller: :main
	get :languages_no_one_speaks, controller: :main
end
