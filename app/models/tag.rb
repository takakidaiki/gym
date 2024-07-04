class Tag < ApplicationRecord
  has_many :gym_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :fitness_gyms, through: :gym_tags

  scope :merge_fitness_gyms, -> (tags){ }
  
  def self.search_fitness_gyms_for(content, method)
    
    if method == 'perfect'
      tags = Tag.where(name: content)
    elsif method == 'forward'
      tags = Tag.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      tags = Tag.where('name LIKE ?', '%' + content)
    else
      tags = Tag.where('name LIKE ?', '%' + content + '%')
    end
    
    return tags.inject(init = []) {|result, tag| result + tag.gyms}
    
  end

end
