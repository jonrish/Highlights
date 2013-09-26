class ChargesController < ApplicationController
	before_action :authenticate_user!

	def new
		@highlight = current_user.highlights.last
		@highlight_type = @highlight.highlight_type
	end

	def create
	  @highlight = current_user.highlights.last
	  @highlight_type = @highlight.highlight_type
	  @amount = @highlight.highlight_type.price


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

	  @highlight.paid

			rescue Stripe::CardError => e
		  	redirect_to new_charge_path, notice: e.message

	end

end
