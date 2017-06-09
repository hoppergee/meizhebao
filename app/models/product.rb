class Product < ApplicationRecord

	has_many :variants, :dependent => :destroy, inverse_of: :product

	accepts_nested_attributes_for :variants, :allow_destroy => true, :reject_if => :all_blank

	belongs_to :category

	has_many :photos
	accepts_nested_attributes_for :photos

	# mount_uploader :image, ImageUploader

	# def variants_attributes=(attributes)
	# 	self.variants << attributes.map {|item| binding.pry; Variant.find(item[:id]) if item.is_a? Hash }
	# 	super
	# end

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

	def has_any_stock?
		if self.stock > 0
			return true
		else
			return false
		end
	end

	def stock
		quantity = 0
		self.variants.each do |v|
			quantity += v.quantity
		end
		quantity
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
