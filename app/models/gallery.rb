class Gallery < ActiveRecord::Base
  
  attr_protected :id

  has_many :photos, :dependent => :destroy
  accepts_nested_attributes_for :photos, :reject_if => lambda { |a| a[:photo].blank? && a[:title].blank? }, :allow_destroy => true

  extend FriendlyId
  friendly_id :name, use: :slugged

  scope :active, :conditions => ["galleries.hidden = false"]
  
end
