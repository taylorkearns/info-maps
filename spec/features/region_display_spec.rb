require 'spec_helper'

describe 'viewing a region' do
  it 'contains the necessary HTML elements and attributes' do
    region = Region.first
    countries = Country.where region_id: region.id

    visit region_path(region)

    page.should have_css "#map-#{region.slug}"
    page.should have_css "ul.#{region.slug}"

    countries.each do |country|
      page.should have_css "li.#{country[:map_id]}"
      page.should have_link country[:name], href: "##{country[:slug]}"
    end
  end
end
