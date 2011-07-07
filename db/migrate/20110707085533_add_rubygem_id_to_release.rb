class AddRubygemIdToRelease < ActiveRecord::Migration
  def change
    add_column :releases, :rubygem_id, :integer
  end
end
