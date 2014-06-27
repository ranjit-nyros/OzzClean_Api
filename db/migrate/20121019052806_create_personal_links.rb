class CreatePersonalLinks < ActiveRecord::Migration
  def change
    create_table :personal_links do |t|
      t.string :url
      t.string :name
      t.string :message_line
      t.string :bgcolor
      t.integer :organization_id
      t.string :attachment

      t.timestamps
    end
  end
end
