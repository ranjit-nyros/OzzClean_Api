class Changedatatypeofgoodofsalesgeniedata < ActiveRecord::Migration
  def change
	change_column :sales_genie_data, :good, :string
  end

end
