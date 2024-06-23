class CreateFitnessGyms < ActiveRecord::Migration[6.1]
  def change
    create_table :fitness_gyms do |t|
      t.text :content
      t.integer :user_id
      t.string :map_address
      t.integer :latitude
      t.integer :longitude

      t.timestamps
    end
  end
end
