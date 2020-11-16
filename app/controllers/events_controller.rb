class EventsController < ApplicationController
  before_action :logged_in?, only: [:create]

  def index
    @events = Event.all
    @upcoming_events = @events.upcoming_events
    @previous_events = @events.previous_events
  end

  def show
    @event = Event.find(params[:id])
    @attendees = User.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      flash.notice = 'Event created'
      redirect_to @event
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:date, :description, :location, :title)
  end
end
