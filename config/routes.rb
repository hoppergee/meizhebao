Rails.application.routes.draw do

	namespace :admin do
		resources :products
	end

	resources :products

  	devise_for :users
	root 'welcome#index'


resources :welcome

end
