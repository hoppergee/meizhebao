class Variant < ApplicationRecord
	belongs_to :product
	has_one :price
	accepts_nested_attributes_for :price
end
