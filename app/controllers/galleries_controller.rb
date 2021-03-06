# -*- encoding: utf-8 -*-
class GalleriesController < AdminController


  def prior_up
    @gallery = Gallery.find(params[:id])
    
    @gallery.prior_red 

    redirect_to galleries_url
  end

  def prior_down
    @gallery = Gallery.find(params[:id])
    
    @gallery.prior_inc
    
    redirect_to galleries_url
  end


  def index
    @galleries = Gallery.order("priority ASC, id DESC").all
  end


  def show
    @gallery = Gallery.find(params[:id])
  end


  def new
    @gallery = Gallery.new
  end


  def edit
    @gallery = Gallery.find(params[:id])
  end


  def create
    @gallery = Gallery.new(params[:gallery])
    
    if @gallery.save
      redirect_to galleries_url, notice: 'Galeria utworzona.'
    else
      render action: "new"
    end
  end

  
  def update
    @gallery = Gallery.find(params[:id])
    
    if @gallery.update_attributes(params[:gallery])
      redirect_to galleries_url, notice: 'Galeria wyedytowana.'
    else
      render action: "edit"
    end
  end
  
  
  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    
    redirect_to galleries_url
  end
end
