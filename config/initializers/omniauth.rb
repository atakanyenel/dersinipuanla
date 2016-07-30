OmniAuth.config.logger=Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	

#  	provider :google_oauth2, ENV["G_CLIENT"],ENV["G_SECRET"] , {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
	 provider :google_oauth2, ENV["G_CLIENT"],ENV["G_SECRET"] ,scope:[ 'email']

end
