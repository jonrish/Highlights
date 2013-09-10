class ChargesController < ApplicationController
	before_action :authenticate_user!

	def new
		@current_highlight = current_user.highlights.last
		@highlight_type = @current_highlight.highlight_type
	end

	def create
	  @current_highlight = current_user.highlights.last
	  @highlight_type = @current_highlight.highlight_type
	  @amount = @current_highlight.highlight_type.price


	  customer = Stripe::Customer.create(
	    :email => 'example@stripe.com',
	    :card  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer',
	    :currency    => 'usd'
	  )

	  @current_highlight.paid
		AdminMailer.delay.new_order_email(@current_highlight)
		UserMailer.delay.processing_email(current_user)

			rescue Stripe::CardError => e
		  	redirect_to new_charge_path, notice: e.message

	end

end
