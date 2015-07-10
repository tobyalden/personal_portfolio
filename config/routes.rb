Rails.application.routes.draw do
  devise_for :users
  root :to => 'categories#index'

  resources 'categories' do
  	resources 'projects' do
      resources 'comments'
    end
  end

end
