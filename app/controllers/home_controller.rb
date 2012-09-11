# -*- encoding: utf-8 -*-
class HomeController < ApplicationController
  def index
    @infos = Info.order("created_at DESC").limit(3)
    @events = Event.order("created_at DESC").limit(4)
    @galleries = Gallery.order("created_at DESC").limit(2)
  end

  def contact
  end

  def subscribe
    if params[:email].present?
      @newsletter_user = NewsletterUser.new(:email => params[:email])
      
      if @newsletter_user.save
        redirect_to root_url, notice: "Pomyślnie zapisano do newslettera"
      else
        redirect_to root_url, alert: "E-mail ma niepoprawny format"
      end
    else
      redirect_to root_url, alert: "Aby zapisać się do newslettera musisz podac e-mail."
    end
  end
end
