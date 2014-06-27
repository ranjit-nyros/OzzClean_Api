class AddAttachmentsCountToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :attachments_count, :integer, default: 0

  end
end
