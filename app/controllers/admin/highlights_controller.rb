class Admin::HighlightsController < ApplicationController
	before_action :authenticate_user!
	before_action :is_admin?

	def index
		@highlights = Highlight.all.order("created_at DESC")
	end

	def show
		@highlight = Highlight.find(params[:id])
	end

	def edit
		@highlight = Highlight.find(params[:id])
	end

	def update
		@highlight = Highlight.find(params[:id])

		if @highlight.update(highlight_params)
			redirect_to admin_highlight_path(@highlight), notice: 'State Changed'	
		end
	end

	def destroy
		@highlight = Highlight.find(params[:id])
		@highlight.destroy

		redirect_to admin_highlights_path, notice: 'Highlight Deleted'
	end

	private

		def highlight_params
			params.require(:highlight).permit(:state_event, :highlight_file)
		end

end
