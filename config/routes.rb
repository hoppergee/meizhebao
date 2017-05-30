Rails.application.routes.draw do

	namespace :admin do
		resources :products
		resources :orders do
			member do
				post :cancel
				post :ship
				post :shipped
				post :return
			end
		end
	end

	resources :products do
		member do
			post :add_to_cart
		end
	end

  	devise_for :users, :controllers => {:omniauth_callbacks => "omniauth_callbacks"}

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
			post :apply_to_cancel
		end
	end

	namespace :account do
		resources :orders
	end

	resources :courses
	resources :courseones
	resources :courseoneslessonones
	
	resources :posts

	resources :about
	resource :user

end
