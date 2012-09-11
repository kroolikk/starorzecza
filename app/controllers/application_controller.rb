class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :prepare_variables


  def prepare_variables
    @pages = Page.all
  end
  
end
