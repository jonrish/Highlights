class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	def after_sign_in_path_for(resource)
  	user_path(current_user)
	end

  private

    def is_admin?
      redirect_to root_path, notice: 'You are not authorized to view that page.' unless current_user.admin
    end


  # rescue_from CanCan::AccessDenied do |exception|
  #   redirect_to root_path, :alert => exception.message
  # end

end
