class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :user_id
      t.integer :rubygem_id
      t.boolean :disabled

      t.timestamps
    end
  end
end
