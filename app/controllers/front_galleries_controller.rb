class FrontGalleriesController < ApplicationController
  before_filter :init_right_panel

  def index
    @galleries = Gallery.all
  end

  def show
    @gallery = Gallery.find(params[:id])
  end
end
