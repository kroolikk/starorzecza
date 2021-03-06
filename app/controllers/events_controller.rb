# -*- encoding: utf-8 -*-
class EventsController < AdminController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(params[:event])

      if @event.save
        redirect_to events_url, notice: 'News został dodany'
      else
        render action: "new"
      end
  end

  def update
    @event = Event.find(params[:id])

      if @event.update_attributes(params[:event])
        redirect_to events_url, notice: "News został wyedytowany"
      else
        render action: "edit"
      end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to events_url
  end
end
