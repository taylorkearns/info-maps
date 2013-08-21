class Country < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions

  after_save :expire_cache

  # TODO This is causing a pg error "undefined method `scoped' for Region:Class"
  #belongs_to_active_hash :region

  validates :name, presence: true, uniqueness: true
  validates :region_id, presence: true
  validates :map_id, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true

  def self.displayed_data
    [:capital, :population, :currency]
  end

  def expire_cache
    Rails.cache.delete 'views/country_data'
  end
end
