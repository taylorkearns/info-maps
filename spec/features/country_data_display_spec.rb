require 'spec_helper'

describe 'viewing optional country data' do
  it 'includes admin-entered data in the markup' do
    pending "eesh how do I test clicking on a map that doesn't exist.."

    region = Region.first
    country = create(:country,
                region_id: region.id,
                capital: 'Capitalsville',
                population: 1000)

    visit region_path region
  end
end
