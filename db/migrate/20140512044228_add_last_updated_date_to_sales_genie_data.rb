class AddLastUpdatedDateToSalesGenieData < ActiveRecord::Migration
  def change
    add_column :sales_genie_data, :last_updated_date, :date
  end
end
