#As an administrator, I want to be able to add, edit and delete coding projects for each skill/category (include name, description, link to Github).

require 'rails_helper'

describe 'adding a project' do
	it 'displays a link on a category page to a form that adds a new project on submit' do
		test_category = Category.create(:name => "JavaScript", :description => "What a useful language.")
		visit category_path(test_category)
		click_on 'New Project'
		fill_in 'Name', :with => 'Love'
		fill_in 'Description', :with => 'A difficult platformer I made'
		fill_in 'Link', :with => 'brlka.itch.io/love'
		click_on 'Create Project'
		expect(page).to have_content 'Love'
	end
end

describe 'viewing a project' do
	it 'displays a link on a category page to each project in that category' do
		test_category = Category.create(:name => "JavaScript", :description => "What a useful language.")
		test_project = test_category.projects.create(:name => "Love", :description => "A difficult platformer.", :link => "brlka.itch.io/love")
		visit category_path(test_category)
		click_on 'Love'
		expect(page).to have_content 'A difficult platformer.'
	end
end