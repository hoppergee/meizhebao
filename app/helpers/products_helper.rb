module ProductsHelper

	def dress_category
		Category.find_by(name: "衣服")
	end



end
