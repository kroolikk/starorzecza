class Gallery < ActiveRecord::Base
  
  attr_protected :id

  has_many :photos, :dependent => :destroy
  accepts_nested_attributes_for :photos, :reject_if => lambda { |a| a[:photo].blank? }, :allow_destroy => true

  extend FriendlyId
  friendly_id :name, use: :slugged
  
end
