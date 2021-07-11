class CreateActorsSeriesJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :actors, :series do |t|
      t.index :actor_id
      t.index :series_id
    end
  end
end
