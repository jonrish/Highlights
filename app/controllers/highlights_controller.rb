class HighlightsController < ApplicationController

	def new
		@highlight = Highlight.new
	end

	def create
		@highlight = Highlight.create(highlight_params)

		if @highlight.save
			redirect_to root_path
		else
			redirect_to new_highlight_path
		end
	end
	
	private

		def highlight_params
			params.require(:highlight).permit(:name, :user_id, :highlight_type_id)
		end

end
