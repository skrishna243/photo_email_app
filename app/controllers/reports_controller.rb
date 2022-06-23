class ReportsController < ApplicationController
	def index	

		if params[:report_type] == '204'
			@start_date          = Date.new( params[:dates_one]["date_from1(1i)"].to_i, params[:dates_one]["date_from1(2i)"].to_i, params[:dates_one]["date_from1(3i)"].to_i).to_date.beginning_of_day
            @end_date            = Date.new( params[:dates_one]["date_to1(1i)"].to_i, params[:dates_one]["date_to1(2i)"].to_i, params[:dates_one]["date_to1(3i)"].to_i).to_date.end_of_day
          
			@stu_data = Student.where("event_date between ? and ? AND school_name = ? AND season_type = ?", @start_date, @end_date , params[:school_name], params[:season_name])
		end
		@source_company_names = School.where(user_id: current_user.id).pluck(:school_name).uniq
	end

end