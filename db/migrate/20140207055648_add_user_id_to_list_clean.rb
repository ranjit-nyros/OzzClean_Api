class AddUserIdToListClean < ActiveRecord::Migration
  def change
		add_column :list_cleans, :user_id, :integer
  end
end
