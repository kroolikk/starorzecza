# -*- encoding: utf-8 -*-
class HomeController < ApplicationController
  include ActionView::Helpers::TextHelper
  before_filter :init_right_panel

  def index
    @infos = Info.order("created_at DESC").limit(3)
  end


  def contact
    @page = Page.find_by_label('kontakt')
  end


  def about
    @page = Page.find_by_label('o-projekcie')
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


  def search
    if params[:key].present?
      params[:key] = truncate(params[:key].to_s, :length => 50)
      
      keys = params[:key].gsub(/[^0-9a-ząćęłńśóżź -]/i, '').split(/[\s\-]/).select{|k| k.size > 2}

      @result_infos = []
      @result_events = []
      @result_galleries = []
      @result_videos = []
      @result_pages = []

      keys.each do |key|
        prep_key = '%'+key+'%'
        @result_infos += Info.where("title LIKE ? OR content LIKE ?", prep_key, prep_key).to_a 
      end
      keys.each do |key|
        prep_key = '%'+key+'%'
        @result_events += Event.where("title LIKE ? OR content LIKE ?", prep_key, prep_key).to_a 
      end
      keys.each do |key|
        prep_key = '%'+key+'%'
        @result_galleries += Gallery.where("name LIKE ?", prep_key).to_a 
      end
      keys.each do |key|
        prep_key = '%'+key+'%'
        @result_videos += Vid.where("title LIKE ? OR description LIKE ?", prep_key, prep_key).to_a 
      end
      keys.each do |key|
        prep_key = '%'+key+'%'
        @result_pages += Page.where("title LIKE ? OR content LIKE ?", prep_key, prep_key).to_a 
      end
    end    
  end


  def send_message
    if params[:name].present? && params[:content].present? && params[:email].present? && params[:email] =~ /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
      ContactMailer.contact_email(params[:name], params[:email], params[:content]).deliver    
      redirect_to contact_url, notice: "Wiadomość wysłana"
    else
      redirect_to contact_url, alert: "Wypełnij prawidłowo pola formularza"
    end
  end
end
