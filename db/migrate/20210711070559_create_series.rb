class CreateSeries < ActiveRecord::Migration[6.0]
  def change
    create_table :series do |t|
      t.string :name
      t.string :genre
      t.integer :no_of_seasons
      t.date :date_of_first_release
      t.string :director

      t.timestamps
    end
  end
end
