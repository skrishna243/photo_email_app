class SeniorSchoolsController < ApplicationController
	require "csv"
	def index
		@senior_schools = SeniorSchool.where(photographer_id: current_user.id)
	end

	def new
		@senior_school = SeniorSchool.new
		respond_simple
	end

	def create
		@senior_school = SeniorSchool.new(senior_school_params)
		if @senior_school.save
			flash[:success] = "School information successfully added"
		else
			flash[:warning] ="School Could not be created"
		end
		redirect_to senior_schools_path
	end

	def edit
		@senior_school = SeniorSchool.find(params[:id])
		respond_simple
	end

	def update
		@senior_school = SeniorSchool.find(params[:id])
		if @senior_school.update(senior_school_params)
			flash[:success] = "School information successfully Updated"
		else
			flash[:danger] = "School informtion cannot update after event"
		end
			 redirect_to senior_schools_path
	end

	def import_student_data
		file = params[:file]
		return redirect_to senior_schools_path, notice: "Only CSV Files" unless file.content_type = "text/csv"
		file = File.open(file)
		csv = CSV.parse(file, headers: true, col_sep: ",")
		csv.each do |row|
				student_hash = {}
				student_hash[:school_id] = params[:school_id]
				student_hash[:photographer_user_id] = current_user.id
				student_hash[:internal_student_id] = row["Internal ID"]
				student_hash[:first_name] = row["First Name"]
				student_hash[:last_name] = row["Last Name"]
				student_hash[:online_code] = row["Online Code"]
				student_hash[:subject_id] = row["Subject ID"]
				student_hash[:phone_number] = row["Phone 1"]
				student_hash[:email] = row["Email(s)"]
				student_hash[:notes] = row["Notes"]
				student_hash[:content_type] = row["Type"]
				student_hash[:organiztion] = row["Organization"]
				student_hash[:reference_number] = row["Reference Number"]
				student_hash[:year] = row["Year"]
				student_hash[:grade] = row["Grade"]
				student_hash[:group] = row["Groups"]
				student_hash[:image_name] = row["Images"]
				student_hash[:yearbook_selection] = row["Yearbook Selection 1"]
		# byebug

				@existing_student = SeniorStudent.where(school_id: student_hash[:school_id], internal_student_id: student_hash[:internal_student_id])
				
				unless @existing_student.present?
					SeniorStudent.create(student_hash)
				end
		end
		redirect_to senior_schools_path, notice: "Students information successfully Uploaded!"
	end

	def upload_senior_student_data
		respond_simple
		# @senior_school = SeniorSchool.find(params[:school_id])
	end

	private

    def respond_simple
      respond_to do |format|
        format.html { render layout: false }
        format.json { render json: @senior_school }
      end
    end

    def senior_school_params
		params.require(:senior_school).permit(:school_name, :season_name, :photographer_id, :session_name)
	end
	
end
