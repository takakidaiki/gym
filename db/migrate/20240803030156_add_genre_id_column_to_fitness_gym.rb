class AddGenreIdColumnToFitnessGym < ActiveRecord::Migration[6.1]
  def change
    add_column :fitness_gyms, :genre_id, :integer
  end
end
