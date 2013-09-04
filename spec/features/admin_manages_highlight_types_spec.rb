require 'spec_helper'

feature 'admin manages highlight types', %q{
	as an admin
	I want to be able to create and edit different plan/ordering options
	so i can set the price and choices available for purchase
} do

# AC
# 1) admin visits new plan page
# 2) only admin can access new plan page
# 3) admin can set plan name, price, description and active status
# 4) admin can edit plan attributes on edit plan page
# 5) only admin can access plan edit page
# 6) admin is able to delete a plan from plan index page
# 7) only admin is able to access plan index page
# 8) admin is able to delete plan from edit plan page
# 9) admin is able to access new plan page from the plan index page

	let(:user) { FactoryGirl.create(:user) }
	let!(:highlight_type) { FactoryGirl.create(:highlight_type) }

	scenario 'non-admin tries to visit highlight_type pages' do
		visit new_admin_highlight_type_path
		expect(current_path).to_not eql(new_admin_highlight_type_path)
		expect(current_path).to eql(root_path)
		visit admin_highlight_types_path
		expect(current_path).to_not eql(admin_highlight_types_path)
		expect(current_path).to eql(root_path)
		visit edit_admin_highlight_type_path(highlight_type)
		expect(current_path).to_not eql(edit_admin_highlight_type_path(highlight_type))
		expect(current_path).to eql(root_path)
	end

	scenario	'admin is able to visit highlight type pages' do
		sign_in_as(user)
		visit new_admin_highlight_type_path
		expect(current_path).to eql(new_admin_highlight_type_path)
		visit admin_highlight_types_path
		expect(current_path).to eql(admin_highlight_types_path)
		visit edit_admin_highlight_type_path(highlight_type)
		expect(current_path).to eql(edit_admin_highlight_type_path(highlight_type))
	end

	scenario 'admin views existing highlight types on index page' do
		sign_in_as(user)
		visit admin_highlight_types_path
		expect(page).to have_content highlight_type.name
		expect(page).to have_content highlight_type.price
		expect(page).to have_content highlight_type.description
		expect(page).to have_content highlight_type.active
	end

	scenario 'admin creates a new highlight_type' do
		sign_in_as(user)
		visit admin_highlight_types_path
		click_on('Create A New Highlight Type')
		expect(current_path).to eql(new_admin_highlight_type_path)
		fill_in 'highlight_type[name]', with: 'Super Deluxe'
		fill_in 'highlight_type[description]', with: 'The Kitchen Sink'
		fill_in 'highlight_type[price]', with: '2500'
		check 'Highlight Type Status' 
		count = HighlightType.all.count
		click_on 'Submit'
		expect(current_path).to eql(admin_highlight_types_path)
		expect(HighlightType.all.count).to eql(count +1)
	end

	scenario 'admin deletes a highlight type' do
		sign_in_as(user)
		visit admin_highlight_types_path
		count = HighlightType.all.count
		click_on 'Delete This Highlight Type'
		expect(current_path).to eql(admin_highlight_types_path)
		expect(HighlightType.all.count).to eql (count -1) 
	end

	scenario 'admin edits a highlight type' do
		sign_in_as(user)
		visit admin_highlight_types_path
		click_on 'Edit This Highlight Type'
		expect(current_path).to eql(edit_admin_highlight_type_path(highlight_type))
		uncheck 'Highlight Type Status'
		click_on 'Submit'
		expect(current_path).to eql(admin_highlight_types_path)
		expect(page).to have_content 'Active: false'
	end

end
