require 'spec_helper'

describe 'viewing a region' do
  it 'contains the necessary HTML elements and attributes' do
    region = Region.first

    visit region_path(region)

    page.should have_css "#map-#{region.id}"
    page.should have_css "ul.#{region.id}"

    region.countries_list.each do |country|
      page.should have_css "li.#{country[:identifier]}"
      page.should have_link country[:name], href: country[:href]
    end
  end
end
