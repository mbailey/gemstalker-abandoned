class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.string :rubygem
      t.string :version
      t.datetime :release_date
      t.boolean :pre

      t.timestamps
    end
  end
end
