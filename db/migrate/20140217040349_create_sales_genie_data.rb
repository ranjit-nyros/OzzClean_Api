class CreateSalesGenieData < ActiveRecord::Migration
  def change
    create_table :sales_genie_data do |t|

	t.boolean :good
	t.date :upload_date
	t.string :file
	t.integer :phone_num
	t.string :company
	t.string :contact
	t.string :sic
	t.string :zip
	t.string :area_code
	t.text :address
	t.string :city
	t.string :state
	t.text :sic_description
	t.string :owner
	t.string :cfo
	t.string :controller
	t.string :ap
	t.string :ar
	t.string :hr
	t.string :cio
	t.string :it
	t.string :sales_manager

	t.integer :user_id
	t.integer :organization_id
	t.integer :list_clean_id
      t.timestamps
    end
  end
end
