require 'spec_helper'

feature 'user creates highlight and registers' do

	let!(:highlight_type) { FactoryGirl.create(:highlight_type) }

	scenario 'user selects a plan' do
		visit root_path
		click_on 'Select This Highlight Type'
		expect(current_path).to eql(new_highlight_path)
	end

	scenario 'user creates a basic highlight' do
		visit root_path
		click_on 'Select This Highlight Type'
		Capybara.exact = true
		fill_in 'highlight[name]', with: 'Joe'
		fill_in 'highlight[user_attributes][email]', with: 'test@test.com'
		fill_in 'highlight[user_attributes][password]', with: '12345678'
		fill_in 'highlight[user_attributes][password_confirmation]', with: '12345678'
		highlight_count = Highlight.all.count
		user_count = User.all.count
		click_on 'Create Your Highlight'
		expect(Highlight.all.count).to eql(highlight_count +1)
		expect(User.all.count).to eq(user_count +1)
		expect(current_path).to eql(root_path)
	end

end
