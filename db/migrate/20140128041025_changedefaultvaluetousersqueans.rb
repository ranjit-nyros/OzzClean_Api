class Changedefaultvaluetousersqueans < ActiveRecord::Migration
  def up
	change_column :users, :question, :string, :default => nil
	change_column :users, :answer, :string, :default => nil
  end

  def down
  end
end
