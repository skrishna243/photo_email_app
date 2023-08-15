class SlateDetailsController < ApplicationController
	def new
		@slate = Slate.find(params[:slate_id])
		@slate_detail = SlateDetail.new
	end

	def create
		@slate = Slate.find(params[:slate_id])
		@slate_detail = @slate.slate_details.create(slate_detail_params)
		if @slate_detail.save
			flash[:success] = "Slate Details Successfully Created"
			redirect_to new_slate_slate_detail_path
		else
			flash[:danger] = "Slate Details creation failed!"
			redirect_to new_slate_slate_detail_path
		end
	end

	def edit
	    @slate = SlateDetail.find(params[:id])
			respond_simple
	end

	def update
		@slate = SlateDetail.find(params[:id])
		if @slate.update(slate_detail_params)
			flash[:success] = "Slate Details successfully Updated"
		else
			flash[:danger] = "Slate Details cannot update after event"
		end
			 redirect_to slate_path(@slate.slate_id)
	end

	private
		def respond_simple
	      respond_to do |format|
	        format.html { render layout: false }
	        format.json { render json: @slate  }
	      end
	    end

		def slate_detail_params
			params.require(:slate_detail).permit(:slate_id, :photographer_id, :sport_name, :team_type, :season_name, :gender_type, 
												 :staff_type, :image_start, :image_end, :total_count, :note, :coach_count, 
												 :atheletes_count, :manager_count)
		end
end