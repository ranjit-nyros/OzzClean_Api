class Changedatatypeofselectionqueryoflistcleans < ActiveRecord::Migration
  def change
	change_column :list_cleans, :selection_query, :text
  end

  def down
  end
end
