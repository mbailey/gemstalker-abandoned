class RenameReleasesRubygem < ActiveRecord::Migration
  def change
    rename_column :releases, :rubygem, :rubygem_name
  end
end
