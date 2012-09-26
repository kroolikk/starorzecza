class AddSlugToVid < ActiveRecord::Migration
  def change
    add_column :vids, :slug, :string
    add_index :vids, :slug
  end
end
