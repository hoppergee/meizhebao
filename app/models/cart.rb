class Cart < ApplicationRecord
	has_many :cart_items
	has_many :variants, through: :cart_items, source: :variant

	def add_variant_to_cart(variant, quantity)
		ci = cart_items.build
		ci.variant = variant
		ci.quantity = quantity
		ci.save
	end

	def total_price
		sum = 0
		cart_items.each do |cart_item|
			if cart_item.variant.price.current.present?
				sum += cart_item.variant.price.current*cart_item.quantity
			end
		end
		sum
	end

	def clean!
		cart_items.destroy_all
	end
end
