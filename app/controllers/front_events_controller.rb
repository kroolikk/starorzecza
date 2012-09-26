class FrontEventsController < ApplicationController
  before_filter :init_right_panel

  def index
    @events = Event.order("created_at DESC")
  end

  def show
    @event = Event.find(params[:id])
  end
end
