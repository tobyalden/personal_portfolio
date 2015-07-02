require 'rails_helper'

# As an administrator, I want to be able to add, edit and delete categories for coding skills 

describe 'adding a category' do
	it 'displays a link on the index to a form that adds a new category when submitted' do
		visit root_path
		click_on 'New Category'
		fill_in 'Name', :with => 'Ruby'
		fill_in 'Description', :with => 'I made a program.'
		click_on 'Create Category'
		expect(page).to have_content 'Ruby'
	end
end

describe 'viewing a category' do
	it "displays a link to each category's page on the index" do
		test_category = Category.create(:name => "Ruby", :description => "I made a program.")
		visit root_path
		click_on 'Ruby'
		expect(page).to have_content 'I made a program.'
	end
end

describe 'deleting a category' do
	it "displays a link on each category's page to delete that category" do
		test_category = Category.create(:name => "Ruby", :description => "I made a program.")
		visit category_path(test_category)
		click_on 'Delete Category'
		expect(page).to have_no_content 'Ruby'
	end
end