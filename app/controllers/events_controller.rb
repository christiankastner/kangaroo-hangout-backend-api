class EventsController < ApplicationController
    skip_before_action :authorized, only: [:create, :destroy]

    def create
        event = Event.create(event_params)
        render json: event
    end
    
    def destroy
        event = Event.find(params[:id])
        event.destroy
        render json: {message: "Event Destroyed"}
    end
    private

    def event_params
        params.require(:event).permit(:date, :user_id, activities_attributes: [
                                                                                :name, 
                                                                                :formatted_address,
                                                                                :icon,
                                                                                :types])
    end
end
