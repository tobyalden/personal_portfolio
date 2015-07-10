class Comment < ActiveRecord::Base
	validates :body, :presence => true
	belongs_to :project
	belongs_to :user
end
