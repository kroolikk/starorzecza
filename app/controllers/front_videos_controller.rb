class FrontVideosController < ApplicationController
  before_filter :init_right_panel

  def index
    @videos = Vid.all
  end

  def show
    @video = Vid.find(params[:id])
  end
end
