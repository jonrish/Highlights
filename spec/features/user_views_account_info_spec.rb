require 'spec_helper'

feature 'user views account info' do

	let(:highlight) { FactoryGirl.create(:highlight) }

	scenario 'user visits account page' do
		sign_in_as(highlight.user)
		visit root_path
		click_link 'My Account'
		expect(current_path).to eql(user_path(highlight.user))
	end

	scenario 'user views info' do
		sign_in_as(highlight.user)
		visit user_path(highlight.user)
		expect(page).to have_content(highlight.user.email)
		expect(page).to have_content(highlight.name)
		expect(page).to have_content(highlight.highlight_type.name)
		expect(page).to have_content(highlight.created_at.strftime("%Y-%m-%d"))
		expect(page).to have_content(highlight.state)
	end

	scenario 'user views individual highlight details' do
		sign_in_as(highlight.user)
		visit user_path(highlight.user)
		click_link 'Change Email or Password'
		expect(current_path).to eql(edit_user_registration_path(highlight.user))
	end


end
