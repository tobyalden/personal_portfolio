require 'rails_helper'

def admin_log_in
	admin_user = User.create(email: 'admin@admin.com', password: 'asdfghjkl', password_confirmation: 'asdfghjkl')
	admin_user.update(admin?: true)
	visit root_path
	click_on 'Login'
	fill_in 'Email', with: 'admin@admin.com'
	fill_in 'Password', with: 'asdfghjkl'
	click_on 'Log in'
end

describe 'adding a category' do
	it 'displays a link on the index to a form that adds a new category when submitted' do
		admin_log_in
		click_on 'New Category'
		fill_in 'Name', :with => 'Ruby'
		fill_in 'Description', :with => 'I made a program.'
		click_on 'Create Category'
		expect(page).to have_content 'Ruby'
	end
end

describe 'editing a category' do
	it 'displays a link on each category page to edit that category' do
		admin_log_in
		test_category = Category.create(:name => "Ruby", :description => "I made a program.")
		visit category_path(test_category)
		click_on 'Edit Category'
		fill_in 'Name', :with => 'Ember.js'
		fill_in 'Description', :with => 'I made a program, but it broke.'
		click_on 'Update Category'
		expect(page).to have_content 'Ember.js'
		expect(page).to have_no_content 'Ruby'
	end
end

describe 'viewing a category' do
	it "displays a link to each category's page on the index" do
		test_category = Category.create(:name => "Ruby", :description => "I made a program.")
		admin_log_in
		click_on 'Ruby'
		expect(page).to have_content 'I made a program.'
	end
end

describe 'deleting a category' do
	it "displays a link on each category's page to delete that category" do
		admin_log_in
		test_category = Category.create(:name => "Ruby", :description => "I made a program.")
		visit category_path(test_category)
		click_on 'Delete Category'
		expect(page).to have_no_content 'Ruby'
	end
end
