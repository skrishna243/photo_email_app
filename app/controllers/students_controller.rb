class StudentsController < ApplicationController
	def index	
		if params[:report_type] == '204'
			@stu_data = Student.where("school_name = ?", params[:school_name])
		end
	end


	def new
		@school = School.find(params[:school_id])
		@student = Student.new
	end

	def create
		@school = School.find(params[:school_id])
		@student = @school.students.create(student_params)
		if @student.save
			flash[:success] = "Have a Good Season!"
			redirect_to new_school_student_path
		else
			flash[:danger] = "Student creation failed!"
			redirect_to new_school_student_path
		end
	end

	private
		def student_params
			params.require(:student).permit(:school_name, :student_name, :student_email, :parent_email, :type_of_sport, :team_type, :photographer_id, :season_type, :event_date, :stu_gender)
		end
	

end
