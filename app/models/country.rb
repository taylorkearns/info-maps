class Country < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions

  # TODO This is causing a pg error "undefined method `scoped' for Region:Class"
  #belongs_to_active_hash :region

  validates :name, presence: true, uniqueness: true
  validates :region_id, presence: true
  validates :map_id, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true
end
