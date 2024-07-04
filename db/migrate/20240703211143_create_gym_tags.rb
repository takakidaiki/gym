class CreateGymTags < ActiveRecord::Migration[6.1]
  def change
    create_table :gym_tags do |t|

      t.timestamps
    end
  end
end
