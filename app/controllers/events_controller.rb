class EventsController < ApplicationController
    skip_before_action :authorized, only: [:create, :destroy]

    def create
        event = Event.new(event_params)
        event.user_id = user_id
        if event.save
            render json: {status: :created}
        else
            render json: {status: :unsuccessful}
    end
    
    def destroy
        event = Event.find(params[:id])
        event.destroy
        render json: {message: "Event Destroyed"}
    end
    private

    def event_params
        params.require(:event).permit(:date, activities_attributes: [
                                                                                :name, 
                                                                                :formatted_address,
                                                                                :icon,
                                                                                :types])
    end
end
