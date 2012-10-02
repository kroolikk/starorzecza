class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :prepare_variables


  def prepare_variables
    @nav_pages = Page.where("label != 'kontakt' AND label != 'o-projekcie'")
  end

  def init_right_panel
    @r_events = Event.order("created_at DESC").limit(4)
    @r_photos = Photo.active.order("RANDOM()").limit(6)
  end
  
end
