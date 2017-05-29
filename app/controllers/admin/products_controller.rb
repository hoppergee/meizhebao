class Admin::ProductsController < ApplicationController

	layout "admin"

	before_action :authenticate_user!
	before_action :admin_require

	def index
		@products = Product.all
	end

	def show
		@product = Product.find_by_friendly_id!(params[:id])
		@photos = @product.photos.all
	end

	def new
		@product = Product.new
		@photo = @product.photos.build
	end

	def create
		@product = Product.new(product_params)

		if @product.save
			if params[:photos] != nil
				params[:photos]['image'].each do |image|
					@photo = @product.photos.create!(:image => image)
				end
			end
			redirect_to admin_products_path
		else
			render :new
		end
	end

	def edit
		@product = Product.find_by_friendly_id!(params[:id])
	end

	def update
		@product = Product.find_by_friendly_id!(params[:id])

		if params[:photos] != nil
			@product.photos.destroy_all
			params[:photos]['image'].each do |image|
				@photo = @product.photos.create!(:image => image)
			end

			@product.update(product_params)
			flash[:notice] = "You have update #{@product.title}'s detail"
			redirect_to admin_products_path

		elsif @product.update(product_params)
			flash[:notice] = "You have update #{@product.title}'s detail"
			redirect_to admin_products_path
		else
			render :edit
		end
				
	end

	def destroy
		@product = Product.find_by_friendly_id!(params[:id])
		@product.destroy
		flash[:notice] = "You have delete #{@product.title}"
		redirect_to admin_products_path
	end

	private

	def product_params
		params.require(:product).permit(:title, :description, :quantity, :price, :category_id, :friendly_id)
	end

	def admin_require
		if !current_user.admin?
			redirect_to "/", alert: "You are not admin."
		end
	end

end
