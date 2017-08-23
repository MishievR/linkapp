class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :person
  belongs_to :group
end
