class AddSgFlagToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :sg, :boolean, :default => false
  end
end
