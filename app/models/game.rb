class Game < ActiveHash::Base
  include ActiveHash::Associations

  #TODO How do I scope regions under games?
  has_many :regions

  self.data = [
    { id: 1, name: 'Find the Country' },
    { id: 2, name: 'Name the Country' }
  ]

  def template_name
    name.parameterize.underscore
  end

  def regions
    Region.all
  end
end
