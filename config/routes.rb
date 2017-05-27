Rails.application.routes.draw do

	namespace :admin do
		resources :products
		resources :orders
	end

	resources :products do
		member do
			post :add_to_cart
		end
	end

  	devise_for :users

  	resources :carts do
  		collection do
  			delete :clean
  			post :checkout
  		end
  	end

  	resources :cart_items

	root 'welcome#index'


	resources :welcome do
		collection do
			get :fix
		end
	end

	resources :orders do
		member do
			post :pay_with_alipay
			post :pay_with_wechat
		end
	end

	namespace :account do
		resources :orders
	end

end
