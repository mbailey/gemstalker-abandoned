class CreateRubygems < ActiveRecord::Migration
  def change
    create_table :rubygems do |t|
      t.string :name

      t.timestamps
    end
  end
end
