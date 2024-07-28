class AddGeocodingColumnToFitnessGym < ActiveRecord::Migration[6.1]
  def change
    add_column :fitness_gyms, :address, :string, null: false, default: ""
    add_column :fitness_gyms, :latitude, :float, null: false, default: 0
    add_column :fitness_gyms, :longitude, :float, null: false, default: 0
  end
end
