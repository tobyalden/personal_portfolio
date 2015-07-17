class Reference < ActiveRecord::Base
	validates :body, :presence => true
end
