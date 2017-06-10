class Variant < ApplicationRecord
	# validates :product, :presence => true
	validates_presence_of :product
	belongs_to :product

	has_one :price, dependent: :destroy, inverse_of: :variant
	accepts_nested_attributes_for :price
end
