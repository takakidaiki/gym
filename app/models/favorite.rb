class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :review

  validates :user_id, presence: true
end
