class HomeController < ApplicationController

	def index
		@highlight_types = HighlightType.all
	end
	
end
