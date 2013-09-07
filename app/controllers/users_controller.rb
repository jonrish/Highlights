class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user

	def show
		@user = User.find(params[:id])
	end

	private

		def correct_user
			@user = User.find(params[:id])
			redirect_to root_path, notice: 'You are not authorized to view that page.' unless current_user.id == @user.id
		end

end