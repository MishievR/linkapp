class User < ApplicationRecord
  has_many :people
  # has_many :person_users
  # has_many :people, through: :person_users
  has_many :groups, dependent: :destroy
  # has_many :user_interests
  # has_many :interests, through: :user_interests
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader


   def name
     "#{first_name} #{last_name}"
   end
end
