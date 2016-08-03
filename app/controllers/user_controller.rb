
class UserController < ApplicationController

	def signup
			auth=request.env['omniauth.auth'] # FIXME direkt sabancıya bağlansın
			user=User.where(uid: auth.uid.to_s).first
			puts "===AUTH==="
			puts auth
			puts "===AUTH==="
			if user
				session[:user_id]=user.id
				redirect_to "/"
			#elsif auth.raw_info.hd!="sabanciuniv.edu"
			#	flash[:danger]="Sign in with sabanciuniv.edu"
			#	redirect_to "/"
			else
				user_mail=auth.info.email
				username=user_mail.partition("@").first
				user_ext=user_mail.partition("@").last
				if user_ext=="sabanciuniv.edu" #sabancı öğrencisi
					user=User.new
					
					user.uid=auth.uid
					user.name=username
					user.email=user_mail
					user.university_id=1 #FIXME constant sabancı için
					
					user.save!
					session[:user_id]=user.id
				else
					flash[:danger]="sign in sabancı"
				end
				redirect_to "/"
		end
	end

	def logout
		session.delete(:user_id)
		redirect_to "/"
	end

end
