class Setdefaultvaluetocount < ActiveRecord::Migration
 def change
	change_column :sales_genie_data, :count, :integer, :default => 0
  end

end
