class GoogleApiController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        response = GoogleMaps::PlacesAdapter.new()
        render json: response.fetch_places(google_api_params)
    end

    private

    def google_api_params
        parameters = params.require(:google_api).permit(:query, :location, :radius, :type)
        
        {
            query: parameters[:query],
            location: parameters[:location],
            radius: parameters[:radius],
            type: parameters[:type]
        }
    end
end
