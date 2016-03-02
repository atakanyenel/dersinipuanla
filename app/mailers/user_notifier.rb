class UserNotifier <ActionMailer::Base
default :from => 'atakanyenel@gmail.com'

	def send_signup_email(firstname,usermail,r)
		@firstname=firstname
		@random=r
		mail(:to =>usermail,
			:subject => "dersinipuanla.com'a hoşgeldiniz")
	end
end
