class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :file
      t.integer :size
      t.integer :user_id
      t.integer :activity_id
      
      t.timestamps
    end
    
    add_index :attachments, :user_id
    add_index :attachments, :activity_id
  end
end