class RemoveLatitudeFromFitnessGym < ActiveRecord::Migration[6.1]
  def change
    remove_column :fitness_gyms, :latitude, :integer
  end
end
