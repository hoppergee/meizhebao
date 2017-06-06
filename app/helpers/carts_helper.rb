module CartsHelper
	def render_cart_total_price(cart)
		cart.total_price
	end

	def render_cart_item_total_price(cart_item)
		cart_item.total_price
	end
end
