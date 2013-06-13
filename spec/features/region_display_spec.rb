require 'spec_helper'

describe 'viewing a region' do
  it 'contains the necessary HTML elements and attributes' do
    region = Region.first

    visit region_path(region)

    page.should have_css "#map-#{region.slug}"
    page.should have_css "ul.#{region.slug}"

    region.countries_list.each do |member|
      page.should have_css "li.#{member[:identifier]}"
      page.should have_link member[:name], href: member[:href]
    end
  end
end
