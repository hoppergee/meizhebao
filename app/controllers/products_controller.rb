class ProductsController < ApplicationController

	def index

		if params[:type]
			@category = Category.find(params[:type])

			if @category.leaf?
				@products = Product.where(category: @category)
				@current_gender_category = @products.first.current_gender_category
			else
				@products = []
				@category.leaves.each do |category|
					@products += category.products
				end
				@products
				@current_gender_category = @products.first.current_gender_category
			end

		else 
			@products = Product.all
			@current_gender_category = Category.find_by(name: "女")
		end
	end

	def show
		@product = Product.find_by_friendly_id!(params[:id])
		@photos = @product.photos.all
		@current_gender_category = @product.current_gender_category
	end

	def add_to_cart
		@product = Product.find_by_friendly_id!(params[:id])
		if !current_cart.products.include?(@product)
			current_cart.add_product_to_cart(@product)
			flash[:notice] = "你已成功将 #{@product.title} 加入购物车"
		else
			flash[:warning] = "你的购物车内已有此物品"
		end
		redirect_to :back
	end

end
