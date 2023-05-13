class ReportsController < ApplicationController
	before_action :set_school_names

	def index	
		if params[:report_type] == '204'
			@start_date          = Date.new( params[:dates_one]["date_from1(1i)"].to_i, params[:dates_one]["date_from1(2i)"].to_i, params[:dates_one]["date_from1(3i)"].to_i).to_date.beginning_of_day
            @end_date            = Date.new( params[:dates_one]["date_to1(1i)"].to_i, params[:dates_one]["date_to1(2i)"].to_i, params[:dates_one]["date_to1(3i)"].to_i).to_date.end_of_day

           if params[:sport_type] == 'All'&& params[:team_type] == 'All'
           		@stu_data = Student.where("event_date between ? and ? AND school_name = ? AND season_type = ? ", @start_date, @end_date , params[:school_name], params[:season_name])		
           elsif params[:team_type] == 'All'
           		@stu_data = Student.where("event_date between ? and ? AND school_name = ? AND season_type = ? AND type_of_sport = ?", @start_date, @end_date , params[:school_name], params[:season_name], params[:sport_type])
           elsif params[:sport_type] == 'All' 
           		@stu_data = Student.where("event_date between ? and ? AND school_name = ? AND season_type = ? AND team_type = ?", @start_date, @end_date , params[:school_name], params[:season_name], params[:team_type])	
           else
				@stu_data = Student.where("event_date between ? and ? AND school_name = ? AND season_type = ? AND team_type = ? AND type_of_sport = ?", @start_date, @end_date , params[:school_name], params[:season_name], params[:team_type], params[:sport_type])
		   end

		end	
		# byebug
		@year = Time.now.year
		@school_start_date = Date.new(@year, 01, 01).to_date.beginning_of_day
		@school_end_date   = Date.new(@year, 12, 31).to_date.end_of_day
		@schools = School.order(updated_at: :desc).where("created_at between ? and ? and user_id =?", @school_start_date, @school_end_date, current_user.id)	
	end

	def event_member
		@event_names = Event.where(user_id: current_user.id).order('event_name asc').pluck(:event_name)
		@event_details = Event.all.order('event_name asc')
		if params[:report_type] == '205'
			@start_date          = Date.new( params[:dates_one]["date_from1(1i)"].to_i, params[:dates_one]["date_from1(2i)"].to_i, params[:dates_one]["date_from1(3i)"].to_i).to_date.beginning_of_day
            @end_date            = Date.new( params[:dates_one]["date_to1(1i)"].to_i, params[:dates_one]["date_to1(2i)"].to_i, params[:dates_one]["date_to1(3i)"].to_i).to_date.end_of_day

            @event_member_data = EventMember.where("event_date between ? and ? AND event_name = ?", @start_date, @end_date, params[:event_name] )

		end

	end

	def senior_student_report

		@senior_schools = SeniorSchool.all.order('school_name asc')
		if params[:report_type] == '206'
			@start_date          	= Date.new( params[:event_date]["date_from1(1i)"].to_i, params[:event_date]["date_from1(2i)"].to_i, params[:event_date]["date_from1(3i)"].to_i).to_date.beginning_of_day
			 @end_date             = Date.new( params[:event_date]["date_from1(1i)"].to_i, params[:event_date]["date_from1(2i)"].to_i, params[:event_date]["date_from1(3i)"].to_i).to_date.end_of_day
			@senior_student_school  = SeniorStudentCheck.where("created_at between ? and ? AND school_id = ?",@start_date, @end_date, params[:school_name] )
			
		end
	end

private

	def set_school_names
		@school_names = School.where(user_id: current_user.id).order('school_name asc').pluck(:school_name).uniq
	end

end