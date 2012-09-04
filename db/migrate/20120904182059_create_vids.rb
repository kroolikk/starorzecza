class CreateVids < ActiveRecord::Migration
  def change
    create_table :vids do |t|
      t.string :title
      t.text :fileurl
      t.text :description

      t.timestamps
    end
  end
end
