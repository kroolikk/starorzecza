class AddPriorityToGallery < ActiveRecord::Migration
  def change
    add_column :galleries, :priority, :integer, :default => 0

    Gallery.all.each_with_index do |g, index|
      g.update_attribute(:priority, index)
    end
  end
end
