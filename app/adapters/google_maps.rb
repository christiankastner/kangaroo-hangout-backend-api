module GoogleMaps
    class PlacesAdapter
        KEY = 'AIzaSyBCHWjw3rHXuSkQDOz2wF7u6nbx9BI3zqk'
        PLACES_URL = 'https://maps.googleapis.com/maps/api/place/textsearch/json?query='

        ## Requires a photo ref tag from the place api response
        PHOTO_URL = 'https://maps.googleapis.com/maps/api/place/photo?photoreference='
        ## Requires a place id tag from the place api response
        DETAILS_URL = 'https://maps.googleapis.com/maps/api/place/details/json?place_id='

        def initialize() 
        end

        def build_places_url(query: query, location: location, radius: radius, type: type)
            fetch_url = PLACES_URL + query.strip.gsub!(/\s+/, '+')

            
            if location
                ## Must convert to geocoded location
                fetch_url += "&location=#{location}"
            end

            ## Not necessary to sanitize this input like the query abaove since these will be forced selections by the user
            if radius
                fetch_url += "&radius=#{radius}"
            end

            if type
                fetch_url += "&type=#{type}"
            end

            return fetch_url + "&key=#{KEY}"
        end

        def fetch_places(query: query, location: location, radius: radius, type: type)
            url = build_places_url(query: query, location: location, radius: radius, type: type)

            response = RestClient.get(url)

            return JSON.parse(response)
        end
    end
end