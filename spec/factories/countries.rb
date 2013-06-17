FactoryGirl.define do
  factory :country do
    region_id { 1 }
    sequence(:map_id) { |i| "gd#{i}" }
    sequence(:slug) { |i| "country-#{i}" }
    name { Faker::Address.country }
  end
end
