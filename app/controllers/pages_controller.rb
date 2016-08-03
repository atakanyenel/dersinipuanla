class PagesController < ApplicationController

	def home
		@title='Dersini Puanla'


		@universities=University.all
		#@courses=Course.where("university_id=?",University.first.id)
		@courses=Course.where("university_id=1").order(:name) #FIXME sabancı Constant
		@user=current_user



	end

	def show

			if params[:trip]
					@course=Course.find_by("id=?",params[:trip][:id]) #found by form
					if !@course
				 		redirect_to "/"
					end
			else
					@course=Course.find_by(id: params[:courseid]) # found by parameter
			end

			@title=@course.name
			@universities=University.all
			#@courses=Course.where("university_id=?",University.first.id)
			@courses=Course.where("university_id=1").order(:name) #FIXME sabancı Constant
			@uni=@course.university
			@comments=@course.comment
			@averagepoint=@course.comment.average(:point)
			if current_user
				@sameuni= current_user.university==@uni
				@topusers=Comment.limit(10).group("user_id").count
				@topusers=@topusers.sort_by{| name,num |num}.reverse!
			end
			@courses_in_same_uni=Course.where('university_id= ?',@uni).order(:name)
	end

	def update_cities
		@courses=Course.where("university_id= ?",params[:university_id]).order(:name)

		respond_to do |format|
			format.js
		end
	end

	def create
		@NewComment=Comment.new
		@NewComment.course_id=params[:comment][:id]
		@NewComment.text=params[:comment][:commentfield]
		@NewComment.user_id=session[:user_id].to_s
		if params[:comment][:point].to_i<5
				@NewComment.point=params[:comment][:point].to_f+1
				if @NewComment.save
						redirect_to "/show/#{params[:comment][:id]}"
				end
		else
		puts "SECURITY HOLE"
		end


	end

	def delete
			if params[:comment_id]
				comment=Comment.find(params[:comment_id])
				course_id=comment.course_id
				if comment.user==current_user
						comment.delete
						redirect_to "/show/#{course_id}"
				else
						redirect_to "/show/#{course_id}"
				end
			end
	end

	def addcourse

			if request.post?


				else
				@title="Ders Ekle"
				@universities=University.all
				#@courses=Course.where("university_id=?",University.first.id)
					@courses=Course.where("university_id=0")
				puts "add course"
			end
	end

	def createcourse
		puts "create course"
		coursesexists=Course.where("name=? and university_id=?",params[:newcourse][:course_name].upcase,current_user.university.id)
		if !coursesexists
		@course=Course.new(name:params[:newcourse][:course_name].upcase, university_id:current_user.university.id)
		@course.save
		redirect_to "/"
	else
		puts 'that course exists'
		redirect_to "/"
	end
	end

end
