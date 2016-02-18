class PagesController < ApplicationController

	def home
		@title='Dersini Puanla'


	@universities=University.all
	@courses=Course.where("university_id=?",University.first.id)
	end

	def show

		@course=Course.find_by("id=?",params[:trip][:id])
		if !@course
			redirect_to "/"
		else
			@title=@course.name
			@universities=University.all
			@courses=Course.where("university_id=?",University.first.id)
			@uni=@course.university
		
			@comments=@course.comment
		end
	end

	def update_cities
		@courses=Course.where("university_id= ?",params[:university_id])
		respond_to do |format|
			format.js
		end
	end

	def create
			@NewComment=Comment.new
			@NewComment.course_id=params[:comment][:id]
			@NewComment.text=params[:comment][:commentfield]
			@NewComment.user_id=1
			@NewComment.save

			@course=Course.find_by(params[:comment][:id])
			@universities=University.all
			@courses=Course.where("university_id=?",University.first.id)
			@uni=@course.university
			@comments=@course.comment
			render "show"
	end
end