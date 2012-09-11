class FrontPagesController < ApplicationController
  def show
    @page = Page.find_by_label(params[:label])
  end
end
