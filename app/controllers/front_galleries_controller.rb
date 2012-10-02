class FrontGalleriesController < ApplicationController
  before_filter :init_right_panel

  def index
    @galleries = Gallery.active.all
  end

  def show
    @gallery = Gallery.active.find(params[:id])
  end
end
