class Person < ActiveRecord::Base
  belongs_to :user
  # has_many :person_users
  # has_many :users, through: :person_users
  has_many :person_groups
  has_many :groups, through: :person_groups

  # has_many :listing_categories
  # has_many :categories, through: :listing_categories
  # has_many :listing_interests
  # has_many :interests, through: :listing_interests

  validates :title, presence: true, length: { minimum: 5, maximum: 35 }
  validates :tag_line, presence: true, length:  { minimum: 1, maximum: 160 }
  validates :description, presence: true, length: { minimum: 1, maximum: 1000 }
  validates :user_id, presence: true
  validates :group_ids, presence: true

  mount_uploader :profile_image_url, AvatarUploader
end
