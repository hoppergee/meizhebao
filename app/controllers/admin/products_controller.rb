class Admin::ProductsController < ApplicationController

	before_action :authenticate_user!
	before_action :admin_require

	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)

		if @product.save
			redirect_to admin_products_path
		else
			render :new
		end
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])

		if @product.update(product_params)
			flash[:notice] = "You have update #{@product.title}'s detail"
			redirect_to admin_products_path
		else
			render :edit
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		flash[:notice] = "You have delete #{@product.title}"
		redirect_to admin_products_path
	end

	private

	def product_params
		params.require(:product).permit(:title, :description, :quantity, :price)
	end

	def admin_require
		if !current_user.admin?
			redirect_to root_path
		end
	end

end
