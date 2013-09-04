require 'spec_helper'

feature 'user signs up' do

	scenario 'user creates an account' do
		visit new_user_registration_path
		fill_in 'user[email]', with: 'test@test.com'
		fill_in 'user[password]', with: '12345678'
		fill_in 'user[password_confirmation]', with: '12345678'
		count = User.all.count
		click_on 'Sign up'
		expect(current_path).to eql(root_path)
		expect(User.all.count).to eql(count +1)
	end

end
