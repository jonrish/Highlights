class HomeController < ApplicationController

	def index
		@highlight_types = HighlightType.all
	end

	def about_us
	end
	
end
