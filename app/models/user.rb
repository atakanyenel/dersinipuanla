class User < ActiveRecord::Base

	self.primary_key="id"
	has_many :comment
	belongs_to :university


	def self.omniauth(auth)
  where(id: auth.uid).first_or_create do |user|
    	puts auth
			puts auth.extra.raw_info
    	#user.provider = auth.provider
    	user.id      = auth.uid
    	user.name     = auth.extra.raw_info.first_name
			user.surname= auth.extra.raw_info.last_name


	  end
	end

end
