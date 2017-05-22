class Category < ApplicationRecord
	acts_as_nested_set

	has_many :products

	def current_dress_category
		
	end
end
