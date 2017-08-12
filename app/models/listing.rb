class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :listing_categories
  has_many :categories, through: :listing_categories
  has_many :listing_interests
  has_many :interests, through: :listing_interests
  validates :title, presence: true, length: { minimum: 5, maximum: 35 }
  validates :tag_line, presence: true, length:  { minimum: 1, maximum: 160 }
  validates :description, presence: true, length: { minimum: 1, maximum: 1000 }
  validates :user_id, presence: true
end
