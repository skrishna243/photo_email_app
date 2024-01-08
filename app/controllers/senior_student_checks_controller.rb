class SeniorStudentChecksController < ApplicationController
	def index
		@senior_check_data = SeniorStudentCheck.where(school_id: params[:senior_school_id])
	end

	def student_checks_expand
		@date = Date.today
		@start_date = @date.beginning_of_day
		@end_date   = @date.end_of_day
		@senior_school_name = SeniorSchool.find(params[:senior_school_id])
		@senior_check_data = SeniorStudentCheck.where("created_at between ? and ? and school_id = ?", @start_date, @end_date,  params[:senior_school_id])
	end

	def show

	end

	def update_student_check
		if params[:id].present?
			@real_session_type = params[:session_type].map(&:to_i)
			@senior_student_check = SeniorStudentCheck.where(school_id: params[:school_id], id: params[:id])
			if	@senior_student_check.update(email: params[:email], first_name: params[:first_name], last_name: params[:last_name], session_type: @real_session_type, subject_id: params[:student_id])
				 flash[:success] = "Student Data Successfully Updated"
			else
				flash[:danger] = "Student Data Updation failed"
			end
		end
	end

	def edit_student_check
		@student_check = SeniorStudentCheck.find(params[:id])
		respond_simple
	end

	private

    def respond_simple
      respond_to do |format|
        format.html { render layout: false }
        format.json { render json: @student_check }
      end
    end

    def student_check_params
    	params.require(:senior_student_check).permit(:school_id, :photographer_user_id, :senior_student_id, :internal_student_id, :first_name, :last_name, :subject_id, :email, :check_type, :full_name, :session_type, :student_online_id, :new_data)
    end
end