class IndexController < ApplicationController
	respond_to :json
    def index
		coords = [request.location.latitude, request.location.longitude] 
        @nearby_events = Event.near(coords, 5)
        puts YAML::dump Event.find(1).firstname
        gon.nearby_events = @nearby_events
	end
end