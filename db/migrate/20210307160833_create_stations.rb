class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.string :name_of_railway_line
      t.string :statation_name
      t.integer :how_many_minutes_walks

      t.timestamps
    end
  end
end
