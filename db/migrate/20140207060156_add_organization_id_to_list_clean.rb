class AddOrganizationIdToListClean < ActiveRecord::Migration
  def change
		add_column :list_cleans, :organization_id, :integer
  end
end
