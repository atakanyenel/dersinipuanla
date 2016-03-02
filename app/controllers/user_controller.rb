
class UserController < ApplicationController

	def signup
		auth=request.env['omniauth.auth']
		user= User.where(id: auth.uid).first
				if user
					session[:user_id]=user.id
					redirect_to "/"
				else
				puts auth
				puts auth.extra.raw_info
				user=User.new
	  		session[:facebook_id]      = auth.uid
	    	user.name     = auth.extra.raw_info.first_name
				user.surname= auth.extra.raw_info.last_name

			end
		end

	def login
		if request.post?
			@user=User.where('name=? and surname=?',params[:user][:firstname],params[:user][:lastname]).first
			#UserNotifier.send_signup_email(@user,random).deliver
			if @user
				flash[:danger] = 'Logged in'
				session[:user_id]=@user.id
				redirect_to '/'

			else
				flash[:danger]='No user with that name'
			end

		else
			# open the login page
		end

	end

	def create

		if 1
			session[:firstname]=params[:user][:firstname]
			session[:lastname]=params[:user][:lastname]
			session[:email]=params[:user][:email]
			session[:university_id]=params[:user][:university_mail]
			random=rand(36**8).to_s(36)
			session[:random]=random

			usermail=session[:email]+'@'+University.find(session[:university_id]).mail
			session[:usermail]=usermail
			UserNotifier.send_signup_email(session[:first_name],usermail,random).deliver
			puts random
			redirect_to "/checkcode"
		end
	end

	def checkcode

	#num=params[:form][:code]
		if request.post?
			if session[:random]==params[:code][:random]
				user=User.new
				user.name=session[:firstname]
				user.surname=session[:lastname]
				user.email=session[:usermail]
				user.university_id=session[:university_id]
				user.id=session[:facebook_id]
				if user.save
					session.clear
					session[:user_id]=user.id
					redirect_to "/"
				end
			end
		end
	end

	def logout
		session.delete(:user_id)
		redirect_to "/"
	end

end
