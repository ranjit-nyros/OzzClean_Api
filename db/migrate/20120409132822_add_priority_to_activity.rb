class AddPriorityToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :priority, :string
    add_index :activities, :priority

  end
end
