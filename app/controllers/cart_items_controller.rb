class CartItemsController < ApplicationController

	before_action :authenticate_user!

	def destroy
		@cart = current_cart
		@cart_item = @cart.cart_items.find_by(variant_id: params[:id])
		@variant = @cart_item.variant
		@cart_item.destroy

		flash[:warning] = "成功将 #{@variant.product.title} 从购物车删除!"
		redirect_to :back
	end

	def update
		@cart = current_cart
		@cart_item = @cart.cart_items.find_by(variant_id: params[:id])

		if @cart_item.variant.quantity >= cart_item_params[:quantity].to_i
			@cart_item.update(cart_item_params)
			flash[:notice] = "成功变更数量"
		else 
			flash[:warning] = "数量不足以加入购物车"
		end

		redirect_to carts_path
	end

	def cart_item_params
		params.require(:cart_item).permit(:quantity)
	end
end
