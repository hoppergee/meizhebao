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


end
