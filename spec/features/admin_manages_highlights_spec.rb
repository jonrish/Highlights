require 'spec_helper'

feature 'an admin manages highlights(orders)' do

	let(:highlight) { FactoryGirl.create(:highlight) }

	scenario 'admin views highlights' do
		sign_in_as(highlight.user)
		visit admin_highlights_path
		expect(page).to have_content(highlight.user.email)
		expect(page).to have_content(highlight.created_at.strftime("%Y-%m-%d"))
		expect(page).to have_content(highlight.highlight_type.name)
	end

	scenario 'admin selects a highlight to manage' do
		sign_in_as(highlight.user)
		visit admin_highlights_path
		click_on 'Manage Highlight'
		expect(current_path).to eql(admin_highlight_path(highlight))
	end

	scenario 'admin changes highlight states' do
		sign_in_as(highlight.user)
		visit admin_highlight_path(highlight)
		click_on 'Accept Highlight'
		expect(page).to have_content('State Changed')
		expect(highlight.state).to eql('accepted')
	end



end






