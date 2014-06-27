class Changedatatypeofsalesvolumesalesgeniedata < ActiveRecord::Migration
  def change
  	change_column :sales_genie_data, :sales_volume, :string
  end

end
