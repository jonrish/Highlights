class Admin::HighlightsController < ApplicationController

	def index
		@highlights = Highlight.all
	end

	def show
		@highlight = Highlight.find(params[:id])
	end

	def accept
		@highlight = Highlight.find(params[:id])
		@highlight.accept_order
		redirect_to admin_highlight_path(@highlight), notice: 'State Changed'
	end

	def in_production
		@highlight = Highlight.find(params[:id])
		@highlight.start_production
		redirect_to admin_highlight_path(@highlight), notice: 'State Changed'
	end

	def complete
		@highlight = Highlight.find(params[:id])
		@highlight.complete
		redirect_to admin_highlight_path(@highlight), notice: 'State Changed'
	end

	def reset
		@highlight = Highlight.find(params[:id])
		@highlight.reset
		redirect_to admin_highlight_path(@highlight), notice: 'State Changed'
	end

end
