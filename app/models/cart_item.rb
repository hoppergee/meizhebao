class CartItem < ApplicationRecord
	belongs_to :cart
	belongs_to :variant

	def total_price
		self.quantity * self.variant.price.current
	end
end
