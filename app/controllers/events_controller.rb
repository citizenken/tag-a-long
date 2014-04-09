class EventsController < ApplicationController
  def index
    @events = Events.all
  end
  
  def create
    @event = Event.new(event_params)
    puts YAML::dump(session[:user_id])
    @event.user_id = session[:user_id]
    @event.count_members = 0
    puts YAML::dump(@event)
    if @event.save
      puts YAML::dump(@event)
    else
      flash[:error] = "didn't saveeee"
    end
    redirect_to request.referer
    
  end
  
  private
  def event_params
    params.require(:event).permit(:title, :description, :address, :time, :max_members)
  end
end
