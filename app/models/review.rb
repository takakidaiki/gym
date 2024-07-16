class Review < ApplicationRecord
  belongs_to :user
  belongs_to :fitness_gym
  has_many :review_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
