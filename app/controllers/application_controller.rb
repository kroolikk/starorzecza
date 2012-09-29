class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :prepare_variables


  def prepare_variables
    #@pages = Page.all
  end

  def init_right_panel
    @r_events = Event.order("created_at DESC").limit(4)
    @r_galleries = Gallery.order("created_at DESC").limit(2)
  end
  
end
