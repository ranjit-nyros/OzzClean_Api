class Addcolumnstosalesgeniedata < ActiveRecord::Migration
  def change
	add_column :sales_genie_data, :exp_date, :date
	add_column :sales_genie_data, :score, :integer
	add_column :sales_genie_data, :emp_size, :integer
	add_column :sales_genie_data, :iusa_num, :integer

  end

end
