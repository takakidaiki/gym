class AddFitnessGymIdToFavorites < ActiveRecord::Migration[6.1]
  def change
    add_column :favorites, :fitness_gym_id, :integer
  end
end
