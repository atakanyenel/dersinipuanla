class Course < ActiveRecord::Base
	belongs_to :university
	has_many :comment
end