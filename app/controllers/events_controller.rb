class EventsController < ApplicationController

    def create
        event = Event.create(event_params)
        render json: EventSerializer.new(event)
    end

    private

    def event_params
        params.require(:event).permit(:date, :user_id, activities_attributes: [:name])
    end
end
