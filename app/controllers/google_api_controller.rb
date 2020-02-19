class GoogleApiController < ApplicationController
    skip_before_action :authorized, only: [:create, :geocode]

    def create
        response = GoogleMaps::PlacesAdapter.new()
        render json: response.fetch_places(google_api_params)
    end

    def geocode
        response = GoogleMaps::PlacesAdapter.new()
        render json: response.get_geocode(google_api_params[:location])
    end

    private

    def google_api_params
        parameters = params.require(:google_api).permit(:query, :location, :radius, :type, geocode: [:lat, :lng])
        {
            query: parameters[:query],
            location: parameters[:location],
            radius: parameters[:radius],
            type: parameters[:type],
            geocode: parameters[:geocode]
        }
    end
end
