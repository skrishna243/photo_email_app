class SeniorStudentsController < ApplicationController
	def index
		@senior_school_name = SeniorSchool.find(params[:senior_school_id])
		@senior_students = SeniorStudent.where(school_id: params[:senior_school_id])
	end

	def student_search
		stu_value = params[:qr_scanned_val].scan(/\d+/)
		if stu_value.present?
			@senior_student_check = SeniorStudentCheck.where(school_id: params[:senior_school_id], internal_student_id: stu_value, check_type: 1).last
			@stu_result = SeniorStudent.where(internal_student_id: stu_value, school_id: params[:senior_school_id]).last
		end
	end

	def check_in
		if params[:student_id].present?
			@senior_student_check = SeniorStudentCheck.create(school_id: params[:senior_school_id], photographer_user_id: current_user.id, senior_student_id: params[:senior_student_id], internal_student_id: params[:student_id], first_name: params[:first_name], last_name: params[:last_name],
									subject_id: params[:student_subject_id], email: params[:student_email], check_type: 1, full_name: params[:student_full_name], session_type: params[:session_type] )
			# redirect_to senior_school_senior_students_url(params[:senior_school_id], message:"success")
			if @senior_student_check.persisted?
				flash[:success] = "Student successfully Checked In"
			else
				flash[:danger] = "Something wrong, Please Check In again. "
			end
		end
	end

	def check_out
		if params[:student_id].present?
			@senior_student_check = SeniorStudentCheck.where(school_id: params[:senior_school_id], internal_student_id: params[:student_id], check_type: 1).last
			if @senior_student_check.present?
				 @senior_student_check.update(check_type: 2)
				 flash[:success] = "Student successfully Checked Out"
				 render json: @senior_student_check
			else
				flash[:danger] = "Check In Student before check Out "
			end
		end
	end
end
