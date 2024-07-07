class FitnessGym < ApplicationRecord
  belongs_to :user
  has_many :gym_tags, dependent: :destroy
  has_many :tags, through: :gym_tags
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy

  accepts_nested_attributes_for :tags

  def save_tags(savebook_tags)
    # 現在のユーザーの持っているskillを引っ張ってきている
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    # 今fitness_gymが持っているタグと今回保存されたものの差をすでにあるタグとする。古いタグは消す。
    old_tags = current_tags - savebook_tags
    # 今回保存されたものと現在の差を新しいタグとする。新しいタグは保存
    new_tags = savebook_tags - current_tags

    # Destroy old taggings:
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name:old_name)
    end

    # Create new taggings:
    new_tags.each do |new_name|
      gym_tag = Tag.find_or_create_by(name:new_name)
      # 配列に保存
      self.tags << gym_tag
    end
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Fitness_gym.where(title: content)
    elsif method == 'forward'
      Fitness_gym.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Fitness_gym.where('title LIKE ?', '%'+content)
    else
      Fitness_gym.where('title LIKE ?', '%'+content+'%')
    end
  end


  def self.search(search)
    if search
      where(['name LIKE ?', "%#{search}%"])
    else
      all
    end
  end
end
