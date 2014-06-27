class ChangeDataTypeOfScoreOfSalesGenieData < ActiveRecord::Migration
  def change
  	change_column :sales_genie_data, :score, :string
  end
end
