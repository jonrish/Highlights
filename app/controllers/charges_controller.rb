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

		rescue Stripe::CardError => e
	  	# flash[:error] = e.message
	  	@current_highlight.stripe_error
	  	redirect_to new_charge_path, notice: e.message

	end

end
