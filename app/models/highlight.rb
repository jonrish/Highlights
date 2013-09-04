class Highlight < ActiveRecord::Base
	state_machine :initial => :pending do
		state :pending
		state :processing

		event :paid do
			transition :pending => :processing
		end

		event :stripe_error do
			transition :processing => :pending
		end
	end

	belongs_to :highlight_type,
		inverse_of: :highlights
	belongs_to :user,
		inverse_of: :highlights

	accepts_nested_attributes_for :user

	validates_presence_of :name
end
