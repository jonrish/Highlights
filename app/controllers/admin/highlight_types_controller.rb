class Admin::HighlightTypesController < ApplicationController
	before_action :authenticate_user!
	before_action :is_admin?

	def index
		@highlight_types = HighlightType.all
	end

	def new
		@highlight_type = HighlightType.new
	end

	def create
		@highlight_type = HighlightType.create(highlight_type_params)
		if @highlight_type.save
			redirect_to admin_highlight_types_path, notice: 'Highlight Type Created.'
		else
			render 'new', notice: 'Highlight Type not created. Please try again.'
		end
	end

	def edit
		@highlight_type = HighlightType.find(params[:id])
	end

	def update
		@highlight_type = HighlightType.find(params[:id])
		if @highlight_type.update(highlight_type_params)
			redirect_to admin_highlight_types_path, notice: 'Highlight Type Updated'
		else
			render 'edit'
		end
	end

	def destroy
		@highlight_type = HighlightType.find(params[:id])
		@highlight_type.destroy
		redirect_to admin_highlight_types_path, notice: 'Highlight Type Deleted'
	end

	private
		def highlight_type_params
			params.require(:highlight_type).permit(:name, :description, :price, :active)
		end

end
