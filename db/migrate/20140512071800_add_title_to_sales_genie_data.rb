class AddTitleToSalesGenieData < ActiveRecord::Migration
  def change
    add_column :sales_genie_data, :title, :string
  end
end
