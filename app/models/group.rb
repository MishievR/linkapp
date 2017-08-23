class Group < ApplicationRecord
  acts_as_votable

  belongs_to :user

  has_many :person_groups
  has_many :people, through: :person_groups
  has_many :category_groups
  has_many :categories, through: :category_groups
  has_many :comments


  validates :user_id, presence: true
  validates :title, presence: true, length: { minimum: 5, maximum: 60 }
  validates :description, presence: true, length: { minimum: 10, maximum: 350 }
  validates :category_ids, presence: true
  validates_uniqueness_of :title

end
