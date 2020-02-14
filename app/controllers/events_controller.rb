class EventsController < ApplicationController
    
    def create
        event = Event.new(event_params)
        event.user = current_user
        if event.save
            render json: {status: :created}
        else
            render json: {status: :unsuccessful}
        end
    end
    
    def destroy
        event = Event.find(params[:id])
        if current_user.id == event.user_id
            event.destroy
            render json: {message: "Event Destroyed"}
        else
            render json: {status: :unsuccessful}
        end
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
