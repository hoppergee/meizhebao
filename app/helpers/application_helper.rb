module ApplicationHelper

	def girl_category
		Category.find_by(name: "女")
	end

	def boy_category
		Category.find_by(name: "男")
	end

end
