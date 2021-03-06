class Admin::UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :is_admin?

	def index
		@users = User.all.order("created_at DESC")
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

		if @user.update(user_params)
			redirect_to admin_user_path(@user), notice: 'User Updated'
		else
			redirect_to edit_admin_user_path(@user), notice: 'User Not Updated'
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy

		redirect_to admin_users_path, notice: 'User Deleted'
	end

	private

		def user_params
			params.require(:user).permit(:admin)
		end
end