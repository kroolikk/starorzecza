class FrontPagesController < ApplicationController
  before_filter :init_right_panel

  def show
    @page = Page.find(params[:id])
  end
end
