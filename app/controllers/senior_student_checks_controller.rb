class SeniorStudentChecksController < ApplicationController
	def index
		@senior_check_data = SeniorStudentCheck.where(school_id: params[:senior_school_id])
	end
end