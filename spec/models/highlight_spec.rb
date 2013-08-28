require 'spec_helper'

describe Highlight do
	it { should validate_presence_of(:name) }
	# it { should validate_presence_of(:user_id) }
	# it { should validate_presence_of(:highlight_type_id) }

	it { should belong_to(:highlight_type) }
	it { should belong_to(:user) }
end
