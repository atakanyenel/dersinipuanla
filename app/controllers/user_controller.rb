
class UserController < ApplicationController



	def signup
			auth=request.env['omniauth.auth'] # FIXME direkt sabancıya bağlansın
			user=User.where(id: auth.uid.to_s).first
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
					session[:user_id]=auth.uid
					user.id=auth.uid
					user.name=username
					user.email=user_mail
					user.university_id=1 #FIXME constant sabancı için
					user.surname="surname"
					user.save!
				else
					flash[:danger]="sign in sabancı"
				end
				redirect_to "/"
		end
	end
	def login
		if request.post?
			@user=User.where('name=? and surname=?',params[:user][:firstname],params[:user][:lastname]).first
			UserNotifier.send_signup_email(@user,random).deliver # FIXME buna gerek yok sanırım
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

	def createuser

		if 1
			session[:firstname]=params[:user][:firstname]
			session[:lastname]=params[:user][:lastname]
			session[:email]=params[:user][:email]
			session[:university_id]=params[:user][:university_id]
			random=rand(36**8).to_s(36)
			session[:random]=random

			usermail=session[:email]+'@'+University.find_by(id: session[:university_id]).mail
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
