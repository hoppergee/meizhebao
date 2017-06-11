class Category < ApplicationRecord
	acts_as_nested_set

	has_many :products

	mount_uploader :image, ImageUploader

	def current_dress_category
		
	end

	def self.boy
		self.find_by(name: "男")
	end

	def self.girl
		self.find_by(name: "女")
	end
end
