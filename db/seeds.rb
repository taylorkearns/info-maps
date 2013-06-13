# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

countries = Country.create!([
  { region_id: 1, map_id: 'sam1',  slug: 'argentina',        name: 'Argentina' },
  { region_id: 1, map_id: 'sam2',  slug: 'bolivia',          name: 'Bolivia' },
  { region_id: 1, map_id: 'sam3',  slug: 'brazil',           name: 'Brazil' },
  { region_id: 1, map_id: 'sam4',  slug: 'chile',            name: 'Chile' },
  { region_id: 1, map_id: 'sam5',  slug: 'colombia',         name: 'Colombia' },
  { region_id: 1, map_id: 'sam6',  slug: 'ecuador',          name: 'Ecuador' },
  { region_id: 1, map_id: 'sam7',  slug: 'guyana',           name: 'Guyana' },
  { region_id: 1, map_id: 'sam8',  slug: 'french-guiana',    name: 'Guyane (French Guiana)' },
  { region_id: 1, map_id: 'sam9',  slug: 'paraguay',         name: 'Paraguay' },
  { region_id: 1, map_id: 'sam10', slug: 'peru',             name: 'Peru' },
  { region_id: 1, map_id: 'sam11', slug: 'suriname',         name: 'Suriname' },
  { region_id: 1, map_id: 'sam12', slug: 'uruguay',          name: 'Uruguay' },
  { region_id: 1, map_id: 'sam13', slug: 'venezuela',        name: 'Venezuela' },
  { region_id: 1, map_id: 'sam14', slug: 'falkland-islands', name: 'Falkland Islands' }
])
