class RegistrationsController < Devise::RegistrationsController

	def new
		@user = User.new
		@user.highlight.build
	end

	def create
		# @highlights = params[:user][:highlights]
		# params[:user].delete :highlights
		@user = User.create(user_params)
		# @highlights[:user_id] = @user.id
		# Highlight.create(highlight_params)

		if @user.save
			redirect_to root_path
		else
			redirect_to new_highlight_path
		end
	end

	private

		def user_params
			params.require(:user).permit(:email, :password, :password_confirmation, highlight_attributes: [])
		end

		# def highlight_params
		# 	@highlights.require(:highlight).permit(:name, :user_id, :highlight_type_id)
		# end

end
