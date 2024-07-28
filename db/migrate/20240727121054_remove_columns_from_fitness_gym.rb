class RemoveColumnsFromFitnessGym < ActiveRecord::Migration[6.1]
  def change
    remove_column :fitness_gyms, :map_address, :string
    remove_column :fitness_gyms, :latitud, :integer
    remove_column :fitness_gyms, :longitude, :integer
  end
end
