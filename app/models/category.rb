class Category < ActiveRecord::Base
  has_many :category_groups
  has_many :groups, through: :category_groups
  # has_many :listing_categories
  validates :name, presence: true, length: {minimum: 3, maximum: 25}
  validates_uniqueness_of :name
end
