class Product < ApplicationRecord

	belongs_to :category

	has_many :photos
	accepts_nested_attributes_for :photos

	# mount_uploader :image, ImageUploader

	def has_images?
		!self.photos.empty? && head_image.present?
	end

	def head_image
		self.photos.first.image
	end

	def is_for_boy?
		level = self.category.level
		diff = level - 1
		current = self.category
		diff.times do
			current = current.parent
		end
		current.name == "男"
	end

	def current_gender_category
		level = self.category.level
		diff = level - 1
		current = self.category
		diff.times do
			current = current.parent
		end
		current
	end


end
