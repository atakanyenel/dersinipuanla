class Course < ActiveRecord::Base

	self.primary_key="id"
	belongs_to :university
	has_many :comment
end
