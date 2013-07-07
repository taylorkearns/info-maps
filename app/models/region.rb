class Region < ActiveHash::Base
  include ActiveHash::Associations

  belongs_to :game

  has_many :countries

  self.data = [
    { id: 1,  slug: 'south-america',  name: 'South America' },
    { id: 2,  slug: 'africa',         name: 'Africa' }
  ]
end
