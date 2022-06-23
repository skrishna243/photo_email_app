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
			redirect_to new_school_student_path, notice: "Have a Good Season!"
		else
			redirect_to new_school_student_path, alert: "Player creation failed"
		end
	end

	private
		def student_params
			params.require(:student).permit(:school_name, :student_name, :student_email, :parent_email, :type_of_sport, :team_type, :photographer_id, :season_type)
		end
	

end
