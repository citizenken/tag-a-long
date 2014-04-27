class IndexController < ApplicationController
	respond_to :json
    def index
		coords = [request.location.latitude, request.location.longitude] 
        @nearby_events = Event.near(coords, 5)
        list_events = Array.new
        @nearby_events.each do |event|
            event_info = [event, event.user]
            list_events << event_info
        end
        gon.nearby_events = list_events
	end
end