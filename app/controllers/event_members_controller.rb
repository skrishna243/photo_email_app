class EventMembersController < ApplicationController
	def new
		@event = Event.find(params[:event_id])
		@event_member = EventMember.new
	end

	def create
		@event = Event.find(params[:event_id])
		@event_member = @event.event_members.create(event_member_params)
		if @event_member.save
			flash[:success] = "Thank You Enjoy Your Event"
			redirect_to new_event_event_member_path
		else
			flash[:danger] = "Event creation failed!"
			redirect_to new_event_event_member_path
		end
	end

	private
		def event_member_params
			params.require(:event_member).permit(:student_name, :student_email, :photographer_id, :event_name, :event_date, :event_id)
		end
end
