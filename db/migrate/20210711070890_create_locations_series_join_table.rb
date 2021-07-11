class CreateLocationsSeriesJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :locations, :series do |t|
      t.index :location_id
      t.index :series_id
    end
  end
end
