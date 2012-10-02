class AddHiddenToGallery < ActiveRecord::Migration
  def change
    add_column :galleries, :hidden, :boolean, :default => false
  end
end
