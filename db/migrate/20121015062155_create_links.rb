class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :product
      t.string :link
      t.string :user_name
      t.string :password
      t.text :notes
      t.integer :organization_id
      t.integer :user_id
      t.boolean :sharebox
      t.string :share_option

      t.timestamps
    end
  end
end
