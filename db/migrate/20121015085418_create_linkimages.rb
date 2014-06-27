class CreateLinkimages < ActiveRecord::Migration
  def change
    create_table :linkimages do |t|
      t.string :link_image
      t.integer :link_id
      t.string :content_type
      t.string :file_size

      t.timestamps
    end
  end
end
