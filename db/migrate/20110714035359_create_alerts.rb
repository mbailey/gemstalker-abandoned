class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.integer :user_id
      t.integer :release_id
      t.datetime :user_notified
      t.boolean :disabled

      t.timestamps
    end
  end
end
