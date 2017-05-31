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
		# @product.variants.build
		@variants = @product.variants
		@colors = @variants.map { |v| v.color}.uniq
		@sizes = @variants.map { |v| v.size}.uniq
	end

	def add_to_cart
		@product = Product.find_by_friendly_id!(params[:id])
		@quantity = params[:quantity].to_i
		@variant = Variant.find_by(product: @product, color: params[:color], size: params[:size])


		if !current_cart.variants.include?(@variant)
			current_cart.add_variant_to_cart(@variant, @quantity)
			flash[:notice] = "你已成功将 #{@variant.product.title} 加入购物车"
		else
			flash[:warning] = "你的购物车内已有此物品"
		end
		redirect_to :back
	end

	def update
		@product = Product.find_by_friendly_id!(params[:id])
		@current_variant = Variant.find_by(product: @product, color: product_params[:color], size: product_params[:size])

		if @product.update(product_params)
			redirect_to :back
		else
			render :show
		end
	end

	def product_params
		params.require(:product).permit(:variants_attributes => [:id, :color, :size])
	end

	helper_method :current_variant
	def current_variant
		@current_variant ||= find_variant
	end

	def find_variant
		@product.variants.first
	end

end
