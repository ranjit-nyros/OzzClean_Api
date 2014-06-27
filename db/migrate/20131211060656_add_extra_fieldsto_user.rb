class AddExtraFieldstoUser < ActiveRecord::Migration
  def up
		add_column :users, :question, :string
		add_column :users, :answer, :string
  end

  def down
  end
end
