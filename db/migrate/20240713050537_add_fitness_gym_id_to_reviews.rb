class AddFitnessGymIdToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :fitness_gym_id, :integer
  end
end
