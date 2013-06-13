class AddIdentifierAndSlugToCountries < ActiveRecord::Migration
  def change
    add_column :countries, :map_id, :string
    add_column :countries, :slug, :string
  end
end
