class Highlight < ActiveRecord::Base
	state_machine :initial => :pending do
		state :pending
		state :processing
		state :accepted
		state :in_production
		state :complete

		event :paid do
			transition :pending => :processing
		end

		event :stripe_error do
			transition :processing => :pending
		end

		event :accept_order do
			transition :processing => :accepted
		end

		event :start_production do
			transition :accepted => :in_production
		end

		event :complete do
			transition :in_production => :complete
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
