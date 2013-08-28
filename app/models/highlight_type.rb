class HighlightType < ActiveRecord::Base
	has_many :highlights,
		inverse_of: :highlight_type

	validates_presence_of :name
	validates_presence_of :description
	validates_presence_of :price
end
