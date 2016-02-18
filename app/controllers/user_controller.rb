
class UserController < ApplicationController

	def signup

	end

	def login
		if request.post?
			@user=User.where('name=? and surname=?',params[:user][:firstname],params[:user][:lastname])

			if @user
				redirect_to '/'
		 		flash[:danger] = 'Logged in'
			else
				flash[:danger]='No user with that name'
			end

		else
			render :template=>'user/signup'
		end
		
	end
	def create

		@user=User.new
		@user.name=params[:user][:firstname]
		@user.surname=params[:user][:lastname]
		@user.email=params[:user][:email]
		@user.university_id=params[:user][:university_id]
		if @user.save
			redirect_to "/"
		end
	end

end