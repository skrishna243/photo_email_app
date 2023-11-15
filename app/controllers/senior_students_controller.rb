class SeniorStudentsController < ApplicationController
	def index
		@date = Date.today
		@start_date = @date.beginning_of_day
		@end_date   = @date.end_of_day
		@senior_school_name = SeniorSchool.find(params[:senior_school_id])
		# @senior_students = SeniorStudent.where(school_id: params[:senior_school_id])
		# @senior_check_results = SeniorStudentCheck.where(school_id: params[:senior_school_id], created_at: cur_date).order(created_at: :desc)
		# @senior_check_in_count = SeniorStudentCheck.where(school_id: params[:senior_school_id], check_type: 1)
		# @senior_check_out_count = SeniorStudentCheck.where(school_id: params[:senior_school_id], check_type: 2)
		@senior_check_results = SeniorStudentCheck.order(updated_at: :desc).where("created_at between ? and ? and school_id = ?", @start_date, @end_date,  params[:senior_school_id])
		@senior_check_in_count = SeniorStudentCheck.where("created_at between ? and ? and school_id = ? and check_type = ?", @start_date, @end_date,  params[:senior_school_id], '1')
		@senior_check_out_count = SeniorStudentCheck.where("created_at between ? and ? and school_id = ? and check_type = ?", @start_date, @end_date,  params[:senior_school_id], '2')
	end

	def student_search
		stu_value = params[:qr_scanned_val].scan(/\d+/)
		if stu_value.present?
			@senior_student_check = SeniorStudentCheck.where(school_id: params[:senior_school_id], internal_student_id: stu_value, check_type: 1).last
			@stu_result = SeniorStudent.where(internal_student_id: stu_value, school_id: params[:senior_school_id]).last
		end
	end

	def check_in
		@real_session_type = params[:session_type].map(&:to_i)
		if params[:student_id].present?
			new_entry =  params[:student_email] == params[:original_student_email] ? "NO" : "YES"
			@senior_student_check = SeniorStudentCheck.create(school_id: params[:senior_school_id], photographer_user_id: current_user.id, senior_student_id: params[:senior_student_id], internal_student_id: params[:student_id], first_name: params[:first_name], last_name: params[:last_name],
									subject_id: params[:student_subject_id], email: params[:student_email], check_type: 1, full_name: params[:student_full_name], session_type: @real_session_type, student_online_id: params[:student_online_id], new_data: new_entry )
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
				new_email_entry =  params[:student_email] == params[:check_in_student_email] ? "NO" : "YES"
				 @senior_student_check.update(check_type: 2, email: params[:student_email], full_name: params[:student_full_name], new_data: new_email_entry, subject_id: params[:student_subject_id])
				 flash[:success] = "Student successfully Checked Out"
				 render json: @senior_student_check
			else
				flash[:danger] = "Check In Student before check Out "
			end
		end
	end

	def check_in_update
		if params[:student_id].present?
			@senior_student_check = SeniorStudentCheck.where(school_id: params[:senior_school_id], internal_student_id: params[:student_id], check_type: 1).last
			if @senior_student_check.present?
					@real_session_type = params[:session_type].map(&:to_i)
					unless params[:check_in_new_data] == "YES"
						new_email_entry =  params[:student_email] == params[:check_in_student_email] ? "NO" : "YES"
						@senior_student_check.update(email: params[:student_email], full_name: params[:student_full_name], new_data: new_email_entry, session_type: @real_session_type, subject_id: params[:student_subject_id]  )
					 	flash[:success] = "Student data successfully updated"
					else
						@senior_student_check.update(email: params[:student_email], full_name: params[:student_full_name], session_type: @real_session_type, subject_id: params[:student_subject_id] )
					 	flash[:success] = "Student data successfully updated"
					end
			else
					flash[:danger] = "Student data didn't update, please try again"
			end
		end
	end
	
end
