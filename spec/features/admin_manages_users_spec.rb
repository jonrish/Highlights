require 'spec_helper'

feature 'admin manages users' do

	let!(:highlight_1) { FactoryGirl.create(:highlight) }
	let!(:highlight_2) { FactoryGirl.create(:highlight) }
	let!(:highlight_3) { FactoryGirl.create(:highlight) }


	scenario 'admin views list of users' do
		sign_in_as(highlight_1.user)
		visit admin_users_path
		expect(page).to have_content(highlight_1.user.id)
		expect(page).to have_content(highlight_2.user.email)
		expect(page).to have_content(highlight_3.user.admin)
		expect(page).to have_content(highlight_1.user.highlights.count)
		expect(page).to have_content(highlight_2.user.created_at.strftime("%Y-%m-%d"))
	end

	scenario 'admin views user details' do
		sign_in_as(highlight_1.user)
		visit admin_users_path
		click_on "View User #{highlight_2.user.id}'s Details"
		expect(current_path).to eql(admin_user_path(highlight_2.user))
		expect(page).to have_content(highlight_2.user.id)
		expect(page).to have_content(highlight_2.user.email)
		expect(page).to have_content(highlight_2.user.admin)
		expect(page).to have_content(highlight_2.user.created_at.strftime("%Y-%m-%d"))
		expect(page).to have_content(highlight_2.name)
		expect(page).to have_content(highlight_2.highlight_type.name)
		expect(page).to have_content(highlight_2.created_at.strftime("%Y-%m-%d"))
		expect(page).to have_content(highlight_2.state)
	end

	scenario 'admin edits user details' do
		sign_in_as(highlight_1.user)
		visit admin_user_path(highlight_2.user)
		click_on 'Edit User'
		expect(current_path).to eql(edit_admin_user_path(highlight_2.user))
		select 'No', from: 'User Admin?'
		click_on 'Update User'
		expect(current_path).to eql(admin_user_path(highlight_2.user))
		expect(highlight_2.user.admin).to eql(false)
	end

	scenario 'admin deletes a user' do
		sign_in_as(highlight_1.user)
		count = User.count
		visit edit_admin_user_path(highlight_2.user)
		click_on 'Delete This User'
		expect(User.count).to eql(count -1)
		expect(current_path).to eql(admin_users_path)
	end

end
