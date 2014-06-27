class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.text :message
      t.string :companyname

      t.timestamps
    end
  end
end
