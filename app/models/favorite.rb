class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :fitness_gym
  belongs_to :review
  
  validates :user_id, uniqueness: {scope: :review_id}
end
