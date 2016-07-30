class User < ActiveRecord::Base

	self.primary_key="id"
	has_many :comment
	belongs_to :university

#FACEBOOK


	def self.omniauth(auth)
  		where(provider: auth.provider,uid: auth.uid).first_or_initialize.tap do |user|
	#user.provider=auth.provider
	puts "===AUTH==="
	puts auth
	puts "===AUTH==="
	puts auth.info
	user.id=auth.uid
	user.name=auth.info.name

	#user.oauth_token=auth.credentials.token
	#user.oauth_expires_at=Time.at(auth.credentials.expires_at)
	user.save!
  		end
	end  	
end

