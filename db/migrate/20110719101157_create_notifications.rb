class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.datetime :sent_at

      t.timestamps
    end
  end
end
