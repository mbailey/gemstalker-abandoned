class AddNotificationIdToAlert < ActiveRecord::Migration
  def change
    add_column :alerts, :notification_id, :integer
  end
end
