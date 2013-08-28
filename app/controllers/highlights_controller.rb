class HighlightsController < ApplicationController

	def new
		@highlight = Highlight.new
		@highlight.build_user unless current_user
		@highlight_type_id = params[:highlight_type_id]
	end

	def create
		@highlight = Highlight.new(highlight_params)
		@highlight.user_id = current_user.id if current_user

		if @highlight.save
			sign_in @highlight.user
			redirect_to root_path, notice: 'Highlight Created'
		else
			redirect_to new_highlight_path
		end
	end
	
	private

		def highlight_params
			params.require(:highlight).permit(:name, :highlight_type_id, user_attributes: [:email, :password, :password_confirmation])
		end

end
