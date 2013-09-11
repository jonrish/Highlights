class HighlightsController < ApplicationController
	before_action :authenticate_user!, except: [:new, :create]
	# before_action :correct_highlight?, except: [:new, :create]
	before_action :edit_highlight?, only: [:edit, :update, :destroy]

	def show
		@highlight = current_user.highlights.find(params[:id])
		@highlight_type = @highlight.highlight_type
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
			redirect_to new_charge_path, notice: 'Highlight Created'
		else
			redirect_to new_highlight_path
		end
	end

	def edit
		@highlight = current_user.highlights.find(params[:id])
		@highlight_type = HighlightType.find(@highlight.highlight_type_id)
	end

	def update
		@highlight = current_user.highlights.where(id: params[:id]).first

		if @highlight.update(highlight_params)
			redirect_to new_charge_path, notice: 'Highlight Updated'
		else
			render 'edit'
		end
	end

	def destroy
		@highlight = current_user.highlights.find(params[:id])
		@highlight.destroy
		redirect_to root_path, notice: 'Highlight Deleted / Order Cancelled'
	end
	
	private

		def highlight_params
			params.require(:highlight).permit(:name, :highlight_type_id, :nickname, :hometown, :school, :previous_teams, :bats, :throwing_hand, :position, :age, :family_friends, :opponent, :scenario, :notes, user_attributes: [:email, :password, :password_confirmation])
		end

		# def correct_highlight?
		# 	@highlight = Highlight.find(params[:id])
		# 	redirect_to root_path, notice: 'You are not authorized to view that page.' unless current_user.id == @highlight.user_id
		# end

		def edit_highlight?
			@highlight = Highlight.find(params[:id])
			redirect_to user_path(current_user), notice: 'You are not authorized to perform that action' unless @highlight.state == 'pending'
		end

end
