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
		@school.update(school_params)
		 respond_to do |format|
			format.html { redirect_to schools_path, notice: 'School information successfully Updated' }
		 end
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
