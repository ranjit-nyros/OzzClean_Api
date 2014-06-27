class ChangeDatatypeOfPhoneNumForSalesGenieData < ActiveRecord::Migration
  def change
	change_column :sales_genie_data, :phone_num, :bigint
  end
end
