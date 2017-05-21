class ProductsController < ApplicationController

	def index

		if params[:type]
			@category = Category.find(params[:type])
			@level = @category.level
			@products=[]
			case @level
			when 1
				@products = @category.children.select{|c| c.name = "春夏"}.first.products
				pry.binding
			when 2
				@products = @category.products
			when 3
				@products = @category.products
			end

			@current_gender_category = @products.first.current_gender_category

			# if @category.leaf?
			# 	@products = Product.where(category: @category)
			# 	@current_gender_category = @products.first.current_gender_category
			# else
			# 	@products = []
			# 	@category.leaves.each do |category|
			# 		@products += category.products
			# 	end
			# 	@products
			# 	@current_gender_category = @products.first.current_gender_category
			# end

		# else 
		# 	@products = Product.all
		end
	end

	def show
		@product = Product.find(params[:id])
		@photos = @product.photos.all
		@current_gender_category = @product.current_gender_category
	end

	def add_to_cart
		@product = Product.find(params[:id])
		if !current_cart.products.include?(@product)
			current_cart.add_product_to_cart(@product)
			flash[:notice] = "你已成功将 #{@product.title} 加入购物车"
		else
			flash[:warning] = "你的购物车内已有此物品"
		end
		redirect_to :back
	end

end
