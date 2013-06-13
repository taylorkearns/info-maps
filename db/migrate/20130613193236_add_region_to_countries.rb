class AddRegionToCountries < ActiveRecord::Migration
  def change
    add_column :countries, :region_id, :integer
  end

  # TODO this is causing a pg error 'column "region" does not exist'
  #add_index :countries, :region
end
