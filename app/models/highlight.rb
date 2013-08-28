class Highlight < ActiveRecord::Base
	belongs_to :highlight_type,
		inverse_of: :highlights
	belongs_to :user,
		inverse_of: :highlights

	validates_presence_of :name
	validates_presence_of :user_id
	validates_presence_of :highlight_type_id
end
