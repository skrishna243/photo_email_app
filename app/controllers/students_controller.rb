class StudentsController < ApplicationController
	def index	
		if params[:report_type] == '204'
			@stu_data = Student.where("school_name = ?", params[:school_name])
		end
	end

	def student_creation
		Student.create(student_name: params[:student_name], student_email: params[:student_email], parent_email: params[:parent_email], 
					   type_of_sport: params[:type_of_sport], team_type: params[:team_type], school_name: params[:school_name])
		redirect_to root_path, notice: "Student Successfully created"
	end

	def new
		@student = Student.new
	end

	def create
		@student = Student.new(student_params)
		if @student.save
			redirect_to root_path, notice: "Student Successfully created"
		else
			redirect_to root_path, alert: "Student creation failure"
		end
	end

	private
		def student_params
			params.require(:student).permit(:school_name, :student_name, :student_email, :parent_email, :type_of_sport, :team_type)
		end
	

end
