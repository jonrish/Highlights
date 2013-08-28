require 'spec_helper'

describe HighlightType do
	it { should validate_presence_of(:name) }
	it { should validate_presence_of(:price) }
	it { should validate_presence_of(:description) }

	it { should have_many(:highlights) }
end
