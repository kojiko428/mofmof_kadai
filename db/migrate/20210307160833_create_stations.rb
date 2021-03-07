class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.string :name_of_railway_line1
      t.string :statation_name
      t.integer :how_many_minutes_walks
      t.string :name_of_railway_line2
      t.string :statation_name2
      t.integer :how_many_minutes_walks2

      t.timestamps
    end
  end
end
