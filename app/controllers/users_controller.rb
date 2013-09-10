class UsersController < ApplicationController
	before_action :authenticate_user!

	def show
		@user = current_user
		@highlights = current_user.highlights
	end

end