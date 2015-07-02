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
