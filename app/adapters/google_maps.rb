module GoogleMaps
    class PlacesAdapter
        KEY = ENV['google_api_key']

        PLACES_URL = 'https://maps.googleapis.com/maps/api/place/textsearch/json?query='

        NEARBY_URL = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location="

        GEOCODE_URL = 'https://maps.googleapis.com/maps/api/geocode/json?address='

        ## Requires a photo ref tag from the place api response
        PHOTO_URL = 'https://maps.googleapis.com/maps/api/place/photo?photoreference='

        ## Requires a place id tag from the place api response
        DETAILS_URL = 'https://maps.googleapis.com/maps/api/place/details/json?place_id='

        def initialize() 
        end

        def sanitize_input(string)
            string.strip.gsub!(/\s+/, '+')
        end

        def get_geocode(location)
            sanitized_location = sanitize_input(location)
            response = RestClient.get("#{GEOCODE_URL}#{sanitized_location}&key=#{KEY}")
            json = JSON.parse(response)["results"][0]["geometry"]["location"]
            {lat: json['lat'], lng: json['lng']}
        end

        def build_places_url(query: query, geocode: geocode, radius: radius, type: type)

            fetch_url = NEARBY_URL + "#{geocode[:lat]},#{geocode[:lng]}&radius=#{radius}"

            ## Not necessary to sanitize this input like the query abaove since these will be forced selections by the user
            if query and query.length > 0
                input = sanitize_input(query)

                fetch_url += "&keyword=#{input}"
            end

            if type and type.length > 0
                fetch_url += "&type=#{type}"
            end

            return fetch_url + "&key=#{KEY}"
        end

        def fetch_places(query: query, geocode: geocode, radius: radius, type: type, location: location)
            url = build_places_url(query: query, geocode: geocode, radius: radius, type: type)
            
            response = RestClient.get(url)
            
            json = JSON.parse(response)
            json["results"] = json["results"].each do |result|
                result["formatted_address"] = result["vicinity"]
            end
            return json
        end
    end
end