class Highlight < ActiveRecord::Base

	mount_uploader :highlight_file, HighlightFileUploader

	# state_machine :initial => :pending do
	# 	state :pending
	# 	state :processing
	# 	state :accepted
	# 	state :in_production
	# 	state :complete

	# 	event :paid do
	# 		transition :pending => :processing
	# 	end

	# 	event :accept do
	# 		transition :processing => :accepted
	# 	end

	# 	event :start_production do
	# 		transition :accepted => :in_production
	# 	end

	# 	event :complete do
	# 		transition :in_production => :complete
	# 	end

	# 	event :reset do
	# 		transition [:complete, :in_production, :accepted, :pending] => :processing
	# 	end

	# 	after_transition :to => :accepted,  :do => :accepted
	# 	after_transition :to => :in_production,  :do => :in_production
	# 	after_transition :to => :complete, :do => :complete
	# end

	# def accepted
	# 	UserMailer.delay.accepted_email(self.user)
	# end

	# def in_production
	# 	UserMailer.delay.production_email(self.user)
	# end

	# def complete
	# 	UserMailer.delay.complete_email(self.user)
	# end

	belongs_to :highlight_type,
		inverse_of: :highlights
	belongs_to :user,
		inverse_of: :highlights

	accepts_nested_attributes_for :user

	# validates_presence_of :name

end
