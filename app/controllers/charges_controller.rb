class ChargesController < ApplicationController

	def new
		@current_highlight = current_user.highlights.last
	end

	def create
	  @current_highlight = current_user.highlights.last
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
		AdminMailer.new_order_email(@current_highlight).deliver
		UserMailer.processing_email(current_user).deliver

			rescue Stripe::CardError => e
		  	redirect_to new_charge_path, notice: e.message

	end

end
