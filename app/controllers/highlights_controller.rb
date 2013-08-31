class HighlightsController < ApplicationController

	def show
		@highlight = Highlight.find(params[:id])
	end

	def new
		@highlight = Highlight.new
		@highlight.build_user unless current_user
		@highlight_type = HighlightType.find(params[:highlight_type_id])
	end

	def create
		@highlight = Highlight.new(highlight_params)
		@highlight.user_id = current_user.id if current_user

		if @highlight.save
			sign_in @highlight.user
			redirect_to highlight_path(@highlight), notice: 'Highlight Created'
		else
			redirect_to new_highlight_path
		end
	end

	def edit
		@highlight = Highlight.find(params[:id])
		@highlight_type = HighlightType.find(@highlight.highlight_type_id)
	end

	def update
		@highlight = Highlight.find(params[:id])

		if @highlight.update(highlight_params)
			redirect_to highlight_path(@highlight), notice: 'Highlight Updated'
		else
			render 'edit'
		end
	end
	
	private

		def highlight_params
			params.require(:highlight).permit(:name, :highlight_type_id, :nickname, :hometown, :school, :previous_teams, :bats, :throwing_hand, :position, :age, :family_friends, :opponent, :scenario, :notes, user_attributes: [:email, :password, :password_confirmation])
		end

end
