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
				if row["Internal ID"].present?
					student_hash[:internal_student_id] = row["Internal ID"]
				end
				if row["First Name"].present?
					student_hash[:first_name] = row["First Name"]
				end
				if row["Last Name"].present?
					student_hash[:last_name] = row["Last Name"]
				end
				if row["Online Code"].present?
					student_hash[:online_code] = row["Online Code"]
				end
				if row["Subject ID"].present?
					student_hash[:subject_id] = row["Subject ID"]
				end
				if row["Phone 1"].present?
					student_hash[:phone_number] = row["Phone 1"]
				end
				if row["Email(s)"].present?
					student_hash[:email] = row["Email(s)"]
				end
				if row["Notes"].present?
					student_hash[:notes] = row["Notes"]
				end
				if row["Type"].present?
					student_hash[:content_type] = row["Type"]
				end
				if row["Organization"].present?
					student_hash[:organiztion] = row["Organization"]
				end
				if row["Reference Number"].present?
					student_hash[:reference_number] = row["Reference Number"]
				end
				if row["Year"].present?
					student_hash[:year] = row["Year"]
				end
				if row["Grade"].present?
					student_hash[:grade] = row["Grade"]
				end
				if row["Groups"].present?
					student_hash[:group] = row["Groups"]
				end
				if row["Images"].present?
					student_hash[:image_name] = row["Images"]
				end
				if row["Yearbook Selection 1"].present?
					student_hash[:yearbook_selection] = row["Yearbook Selection 1"]
				end


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
