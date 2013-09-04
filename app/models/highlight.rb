class Highlight < ActiveRecord::Base
	state_machine :initial => :pending do
		state :pending
		state :processing
		state :accepted
		state :in_production
		state :complete

		event :paid do
			transition :pending => :processing
			# email user & admin
		end

		event :stripe_error do
			transition :processing => :pending
			# email user & admin
		end

		event :accept_order do
			transition :processing => :accepted
			# email user
		end

		event :start_production do
			transition :accepted => :in_production
			# email user
		end

		event :complete do
			transition :in_production => :complete
			# email user
		end

		# temp for testing
		event :reset do
			transition [:complete, :in_production, :accepted, :pending] => :processing
		end
	end

	belongs_to :highlight_type,
		inverse_of: :highlights
	belongs_to :user,
		inverse_of: :highlights

	accepts_nested_attributes_for :user

	validates_presence_of :name
end
