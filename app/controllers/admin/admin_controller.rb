class Admin::AdminController < ApplicationController
	before_action :authenticate_user!
	before_action :is_admin?

	def index
	end

end