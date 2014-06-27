class Addcolumntosalesgeniedata < ActiveRecord::Migration
  def change
	add_column :sales_genie_data, :fax_num, :integer
  end

end
