class FitnessGym < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def self.search(search) 
    if search
      where(['name LIKE ?', "%#{search}%"]) 
    else
      all 
    end
  end
end
