class Addcolumnstolistcleans < ActiveRecord::Migration
  def up
	add_column :list_cleans, :status, :string, defualt: nil
	add_column :list_cleans, :newfile, :string
  end

  def down
	remove_column :list_cleans, :status, :string
	remove_column :list_cleans, :newfile, :string
  end
end
