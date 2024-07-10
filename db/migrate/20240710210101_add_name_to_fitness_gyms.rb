class AddNameToFitnessGyms < ActiveRecord::Migration[6.1]
  def change
    add_column :fitness_gyms, :name, :string
  end
end
