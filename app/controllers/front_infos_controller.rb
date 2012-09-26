class FrontInfosController < ApplicationController
  before_filter :init_right_panel

  def index
    @infos = Info.order("created_at DESC")
  end

  def show
    @info = Info.find(params[:id])
  end
end
