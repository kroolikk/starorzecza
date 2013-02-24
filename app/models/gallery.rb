class Gallery < ActiveRecord::Base
  
  attr_protected :id

  has_many :photos, :dependent => :destroy
  accepts_nested_attributes_for :photos, :reject_if => lambda { |a| a[:photo].blank? && a[:title].blank? }, :allow_destroy => true

  extend FriendlyId
  friendly_id :name, use: :slugged

  scope :active, :conditions => ["galleries.hidden = false"]
  
  after_validation :set_prior, :on => :create


  def set_prior
    lower = Gallery.order("priority DESC").to_a.first
    self.priority = lower.priority + 1 if lower.present?
  end


  def prior_inc
    higher_prior = Gallery.where("priority = #{self.priority + 1}").first
    higher_prior.priority -= 1 if higher_prior.present?
    higher_prior.save if higher_prior.present?
    
    self.priority += 1
    self.save
  end
  
  
  def prior_red
    lower_prior = Gallery.where("priority = #{self.priority - 1}").first
    lower_prior.priority += 1 if lower_prior.present?
    lower_prior.save if lower_prior.present?
    
    self.priority -= 1
    self.save    
  end
end
