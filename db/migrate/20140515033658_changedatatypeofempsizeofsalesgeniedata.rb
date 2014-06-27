class Changedatatypeofempsizeofsalesgeniedata < ActiveRecord::Migration
  def change
	change_column :sales_genie_data, :emp_size, :string
  end
end
