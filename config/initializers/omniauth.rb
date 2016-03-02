OmniAuth.config.logger=Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook,ENV["FACEBOOK_ID"] ,ENV["FACEBOOK_SECRET"] ,
  scope: 'public_profile', info_fields: 'first_name,last_name'
end
