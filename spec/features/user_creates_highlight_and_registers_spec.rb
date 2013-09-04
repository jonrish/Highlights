require 'spec_helper'

feature 'user creates highlight and registers' do

	let!(:highlight_type_basic) { FactoryGirl.create(:highlight_type) }
	let!(:highlight_type_deluxe) { FactoryGirl.create(:highlight_type, name: 'Deluxe', price: '2000') }
	let!(:highlight_type_super) { FactoryGirl.create(:highlight_type, name: 'Super', price: '2500') }

	let(:user) { FactoryGirl.create(:user) }

	scenario 'user selects a plan' do
		visit root_path
		within('li#'+highlight_type_super.name) do
			click_on 'Select This Highlight Type'
		end
		expect(current_path).to eql(new_highlight_path)
	end

	scenario 'user creates a basic highlight and registers' do
		visit root_path
		within('li#'+highlight_type_basic.name) do
			click_on 'Select This Highlight Type'
		end
		fill_in 'highlight[name]', with: 'Joe'
		fill_in 'highlight[user_attributes][email]', with: 'test@test.com'
		fill_in 'highlight[user_attributes][password]', with: '12345678'
		fill_in 'highlight[user_attributes][password_confirmation]', with: '12345678'
		highlight_count = Highlight.all.count
		user_count = User.all.count
		click_on 'Create Your Highlight'
		expect(Highlight.all.count).to eql(highlight_count +1)
		expect(User.all.count).to eq(user_count +1)
		expect(current_path).to eql(new_charge_path)
	end

	scenario 'user creates a deluxe highlight' do
		sign_in_as(user)
		visit	root_path
		within('li#'+highlight_type_deluxe.name) do
			click_on 'Select This Highlight Type'
		end
		fill_in 'highlight[name]', with: 'Joe'
		fill_in 'highlight[age]', with: '39'
		highlight_count = Highlight.all.count
		click_on 'Create Your Highlight'
		expect(Highlight.all.count).to eql(highlight_count +1)
		expect(current_path).to eql(new_charge_path)
	end

	scenario 'user creates a deluxe highlight' do
		sign_in_as(user)
		visit root_path
		within('li#'+highlight_type_super.name) do
			click_on 'Select This Highlight Type'
		end
		fill_in 'highlight[name]', with: 'Joe'
		fill_in 'highlight[family_friends]', with: 'Jimmy'
		highlight_count = Highlight.all.count
		click_on 'Create Your Highlight'
		expect(Highlight.all.count).to eql(highlight_count +1)
		expect(current_path).to eql(new_charge_path)
		expect(page).to have_content(highlight_type_super.name)
	end

end
