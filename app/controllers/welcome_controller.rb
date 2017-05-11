class WelcomeController < ApplicationController

	def index
		flash[:notice] = "大家早上好"
		flash[:alert] = "大家早上好"
		flash[:warning] = "大家早上好"
	end

end
