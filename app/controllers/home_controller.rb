# -*- encoding: utf-8 -*-
class HomeController < ApplicationController
  before_filter :init_right_panel

  def index
    @infos = Info.order("created_at DESC").limit(3)
  end

  def contact
  end

  def about
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
