class Category < ApplicationRecord
	acts_as_nested_set

	has_many :products

	mount_uploader :image, ImageUploader

	def current_dress_category
		
	end
end
