class ChargesController < ApplicationController

	def new
		@current_highlight = current_user.highlights.last
	end

	def create
	  # Amount in cents
	  @amount = current_user.highlights.last.highlight_type.price


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

		rescue Stripe::CardError => e
	  	flash[:error] = e.message
	  	redirect_to charges_path

	end

end
