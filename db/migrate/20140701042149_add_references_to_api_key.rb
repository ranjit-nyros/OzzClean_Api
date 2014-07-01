class AddReferencesToApiKey < ActiveRecord::Migration
  def up
	add_column :api_keys, :user_id, :integer
	add_column :api_keys, :organization_id, :integer
  end

  def down
	remove_column :api_keys, :user_id
	remove_column :api_keys, :organization_id
  end
end
