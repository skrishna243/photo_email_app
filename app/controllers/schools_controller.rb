class SchoolsController < ApplicationController
	def index
		@schools = School.where(user_id: current_user.id)
	end

	def new
		@school = School.new
		respond_simple
	end

	def create
		@school = School.new(school_params)
		if @school.save
			flash[:success] = "School information successfully added"
		else
			flash[:warning] ="School Could not be created"
		end
		redirect_to schools_path
	end

	def edit
		@school = School.find(params[:id])
		respond_simple
	end

	def update
		@school = School.find(params[:id])
		# @student_search = Student.find_by_school_id(@school.id)
		if @school.update(school_params)
			flash[:success] = "School information successfully Updated"
		else
			flash[:danger] = "School informtion cannot update after event"
		end
			 redirect_to schools_path


		# if @student_search.blank?
		# 	@school.update(school_params)
		# 	 # respond_to do |format|
		# 	# 	format.html { redirect_to schools_path, notice: 'School information successfully Updated' }
		# 	 # end
		# 	 flash[:success] = "School information successfully Updated"
		# 	 redirect_to schools_path
		# else
		# 	 # respond_to do |format|
		# 	# 	format.html { redirect_to schools_path, alert: 'School informtion cannot update after event' }
		# 	 # end
		# 	 flash[:danger] = "School informtion cannot update after event"
		# 	 redirect_to schools_path
		# end
	end

	def show
		@school = School.find(params[:id])
		@student_school = Student.where(school_id: params[:id])
	end

	private

    def respond_simple
      respond_to do |format|
        format.html { render layout: false }
        format.json { render json: @school }
      end
    end

    def school_params
			params.require(:school).permit(:school_name, :season_name, :user_id)
		end
end
