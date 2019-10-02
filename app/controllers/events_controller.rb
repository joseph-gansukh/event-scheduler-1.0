class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end
  
  def show
    find_event
    find_creator
  end

  def create
    @event = Event.new(event_params)
    p params
    if @event.save
      flash[:success] = "Event successfully created"
      redirect_to @event
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def edit
    find_event
  end
  
  def update
    find_event
      if @event.update_attributes(params[:event])
        flash[:success] = "Event was successfully updated"
        redirect_to @event
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  
  def destroy
    find_event
    if @event.destroy
      flash[:success] = 'Event was successfully deleted.'
      redirect_to events_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to events_url
    end
  end
  
  private

  def event_params 
    params.require(:event).permit(:name, :date, :time, :description, :location, :creator_id)
  end

  def find_event
    @event = Event.find(params[:id])
  end
  
  def find_creator
    find_event
    @creator = User.find(@event.creator_id)
  end
end
