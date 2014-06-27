class AddUpDateColumnToSalesGenieData < ActiveRecord::Migration
  def change
    add_column :sales_genie_data, :up_date, :date
  end
end
