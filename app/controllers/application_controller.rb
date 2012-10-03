class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :prepare_variables


  def prepare_variables
    @nav_pages = Page.where("label != 'kontakt' AND label != 'o-projekcie' AND label != 'english'")    
  end

  def init_right_panel
    @r_events = Event.order("created_at DESC").limit(4)    
    @r_photos = random_records(Photo.active, 'photos', 6)
    # @r_photos = Photo.active.order("RANDOM()").limit(6)
  end
  

  def random_records(s_model, s_table_name, s_limit)
    rand_ids = s_model.all.collect{|m| m.id}.shuffle[0..s_limit-1].join(',')
    rand_ids = 0 if rand_ids.blank?
    rand_objects = s_model.where("#{s_table_name}.id IN ( #{rand_ids} )")
    return rand_objects
  end
end
