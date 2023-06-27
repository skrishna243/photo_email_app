class SlatesController < ApplicationController

	def index
		# @slates = Slate.where(photographer_id: current_user.id)
		@slates = Slate.all
	end

	def new
		@slate = Slate.new
		respond_simple
	end

	def create
		@slate = Slate.new(slate_params)
		if @slate.save
			flash[:success] = "Slate information successfully added"
		else
			flash[:warning] ="Slate Could not be created"
		end
		redirect_to slates_path
	end

	def show
		@slate = Slate.find_by_id(params[:id])
		@slate_detail_data = SlateDetail.where(slate_id: params[:id])
	end

	def slate_school_search
		patient_search = "#{params[:query]}%"
      	results = SchoolName.where("name LIKE ?", "%#{patient_search}%").map { |user| {  school_name:"#{user.name}"}}
		render json: results
	end

	private

	    def respond_simple
	      respond_to do |format|
	        format.html { render layout: false }
	        format.json { render json: @slate }
	      end
	    end

	    def slate_params
			params.require(:slate).permit(:school_name, :season_name, :photographer_id, :photographer_name)
		end
end
