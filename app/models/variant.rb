class Variant < ApplicationRecord
	belongs_to :product
	has_one :price, dependent: :destroy, inverse_of: :variant
	accepts_nested_attributes_for :price
end
