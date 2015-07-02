class Project < ActiveRecord::Base
	belongs_to :category
	validates :name, :presence => true
	validates :description, :presence => true
	validates :link, :presence => true
end