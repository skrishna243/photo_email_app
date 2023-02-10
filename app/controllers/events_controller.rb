class EventsController < ApplicationController
	def index
		@events = Event.where(user_id: current_user.id)
	end

	def new
		@event = Event.new
		respond_simple
	end

	def create
		@event = Event.new(event_params)
		if @event.save
			flash[:success] = "Event information successfully added"
		else
			flash[:warning] ="Event Could not be created"
		end
		redirect_to events_path
	end

	def edit
		@event = Event.find(params[:id])
		respond_simple
	end

	def update
		@event = Event.find(params[:id])
		if @event.update(event_params)
			flash[:success] = "Event information successfully Updated"
		else
			flash[:danger] = "Event informtion cannot update"
		end
			 redirect_to events_path
	end

	private

	    def respond_simple
	      respond_to do |format|
	        format.html { render layout: false }
	        format.json { render json: @event }
	      end
	    end

	    def event_params
			params.require(:event).permit(:event_name, :event_location, :user_id)
		end
end
