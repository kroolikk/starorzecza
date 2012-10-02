class Photo < ActiveRecord::Base
  belongs_to :gallery

  mount_uploader :photo, PhotoUploader

  scope :active, :joins => :gallery, :conditions => ["galleries.hidden = false"]


  def self.recreate_all_photos
    photos = Photo.all
    photos.each do |p|
      if p.photo.present?
        p.photo.cache_stored_file!
        p.photo.recreate_versions!
      end
    end
  end
end
