class RemoveFitnessGymIdFromFavorites < ActiveRecord::Migration[6.1]
  def change
    remove_column :favorites, :fitness_gym_id, :integer
  end
end
