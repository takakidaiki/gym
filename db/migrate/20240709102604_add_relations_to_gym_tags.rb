class AddRelationsToGymTags < ActiveRecord::Migration[6.1]
  def change
    add_column :gym_tags, :fitness_gym_id, :integer
    add_column :gym_tags, :tag_id, :integer
  end
end
