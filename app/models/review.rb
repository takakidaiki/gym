class Review < ApplicationRecord
  belongs_to :user
  has_many :review_comments, dependent: :destroy
end
