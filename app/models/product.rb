class Product < ApplicationRecord

	has_many :variants, :dependent => :destroy, inverse_of: :product

	accepts_nested_attributes_for :variants, :allow_destroy => true, :reject_if => :all_blank

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

	before_validation :generate_friendly_id, :on => :create
	validates_presence_of :title, :friendly_id

	validates_uniqueness_of :friendly_id
	validates_format_of :friendly_id, :with => /\A[a-z0-9\-]+\z/

	def to_param
		self.friendly_id
	end

	protected

	def generate_friendly_id
		self.friendly_id ||= SecureRandom.uuid
	end


end
