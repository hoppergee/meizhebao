module ApplicationHelper

	def girl_category
		Category.find_by(name: "女")
	end

	def boy_category
		Category.find_by(name: "男")
	end

	def course_category
		Category.find_by(name: "课程")
	end

end
